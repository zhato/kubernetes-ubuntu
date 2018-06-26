$Env:KUBECONFIG = "E:\work\Kubernetes\kubernetes-ubuntu\admin.conf"

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

# dashboard account setting
https://gist.github.com/kairen/e816bbc9859e3ef5a877f4991f7081a3

'' kubectl -n kube-system get sa dashboard -o yaml
'' kubectl -n kube-system describe secrets dashboard-token-vg52j
