$Env:KUBECONFIG = "E:\work\Kubernetes\kubernetes-ubuntu\admin.conf"

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/.

kubeadm join 192.168.56.30:8080 --token 56225f.9096af3559800a6a --discovery-token-ca-cert-hash sha256:ac500c9894083c08ccf5c0f6f595317df60054c24c84a0acb882f0c1b870d4e7


# dashboard account setting
https://gist.github.com/kairen/e816bbc9859e3ef5a877f4991f7081a3

kubectl -n kube-system create sa dashboard
kubectl create clusterrolebinding dashboard --clusterrole cluster-admin --serviceaccount=kube-system:dashboard
kubectl -n kube-system get sa dashboard -o yaml
kubectl -n kube-system describe secrets dashboard-token-vg52j

eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkYXNoYm9hcmQtdG9rZW4tcXJ3cnEiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGFzaGJvYXJkIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiNjhmMzhmOTktNzA1OS0xMWU4LTgxMDgtMDJhM2JlMjRiMTRmIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRhc2hib2FyZCJ9.zZWSV7KuYYmmmM6EBR2776Seb2OvfdT3B5vrQp-4N2N8wraWLSjC85jNfoosfUnXp__oTlkXt1G4MmfpMI4cm4k6PGqYt9aYJdjNWVI16Gy_iRY38s1uDaCp55cgI5pJOVkXOS-ddyqZOqAi5hAK7yLwy66bY_STCO7uq9puIq3FlpXApvskL1dYrv_i0tiB6k3lbxOSTwAZwCht2WLtfPQH5miEUzSF8flCPrI3-B5AQ2IKQMhVfz69Md0HoynaWVFKqZuZOISmm5do4jfrOWa7g9Ajxijtp1p1Q-PehaUxoUIk1XcpRB4c1DP3KOaCVc_UGFBbMBpfR9n5eItIWA