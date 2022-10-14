oc create serviceaccount eap-service-account 
oc policy add-role-to-user view system:serviceaccount:test:eap-service-account
oc create secret generic eap-app-secret --from-file=keystore.jks
oc secrets link eap-service-account eap-app-secret 
oc secrets link default image-pull-secret --for=pull
oc secrets link builder image-pull-secret --for=pull
oc import-image jboss-eap-7/eap74-openjdk8-runtime-openshift-rhel7:7.4.5-4 --from=registry.redhat.io/jboss-eap-7/eap74-openjdk8-runtime-openshift-rhel7:7.4.5-4 --confirm 
oc replace -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk8-image-stream.json


oc import-image eap74-openjdk8-runtime-openshift-rhel7:7.4.5-4 --from=registry.redhat.io/jboss-eap-7/eap74-openjdk8-runtime-openshift-rhel7:7.4.5-4 --confirm

