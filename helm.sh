aws eks update-kubeconfig --name dev-eks
if [ "$1" == "install" ]; then
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm repo add elastic https://helm.elastic.co

  helm repo update

  helm upgrade -i  nginx-ingress  ingress-nginx/ingress-nginx
  kubectl apply -f external-dns.yml
  helm install filebeat elastic/filebeat -f filebeat.yml
fi


if [ "$1" == "uninstall" ]; then
  helm uninstall nginx-ingress
  kubectl delete -f external-dns.yml
  helm uninstall filebeat
fi