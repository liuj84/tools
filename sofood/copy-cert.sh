PROJECT=aaa
kubectl cp psearch-controller-0:/usr/local/openjdk-11/lib/security/cacerts ./cacerts -n "${PROJECT}"
echo
DOGFOOD_POD_NAME=$(kubectl get po -n $PROJECT -l app=sofood -o jsonpath="{.items[*].metadata.name}")
kubectl cp ./cacerts "${DOGFOOD_POD_NAME}":/mnt/sofood-ssl/cacerts -n $PROJECT
