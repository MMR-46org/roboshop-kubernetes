argocd login argocd.madhanmohanreddy.tech  --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) --insecure

for i in cart catalogue user payment shipping frontend ; do
argocd app create $i --repo https://github.com/MMR-46org/$i --path k8s --dest-namespace default --dest-server https://kubernetes.default.svc --directory-recurse --sync-policy none
done