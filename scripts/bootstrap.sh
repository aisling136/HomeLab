#!/bin/bash

#Namespaces
kubectl create ns argocd
kubectl create ns network
kubectl create ns longhorn
kubectl create ns onepassword-connect
kubectl create ns external-secrets
echo "Created namespaces. Sleeping 30 seconds"

#secret
kubectl apply -f ./tmp/connect_secret.yaml

#CoreDNS
./scripts/component.sh -c cilium
kubectl apply -f ./tmp/cilium -R --server-side=true -n kube-system
echo "Applied cilium. Sleeping 30 seconds"
sleep 30

#CSR approval
./scripts/component.sh -c kubelet-csr-approver
kubectl apply -f ./tmp/kubelet-csr-approver -R --server-side=true -n kube-system
echo "Applied kubelet-csr-approver. Sleeping 30 seconds"
sleep 30

#CRDs
./scripts/component.sh -c prometheus-operator-crds
kubectl apply -f ./tmp/prometheus-operator-crds -R --server-side=true
echo "Applied prometheus-operator-crds. Sleeping 30 seconds"
sleep 30

#CoreDNS
./scripts/component.sh -c coredns
kubectl apply -f ./tmp/coredns -R --server-side=true -n kube-system
echo "Applied coredns. Sleeping 30 seconds"
sleep 30

#Ingress nginx
./scripts/component.sh -c ingress-nginx
kubectl apply -f ./tmp/ingress-nginx -R --server-side=true -n network
echo "Applied ingress-nginx. Sleeping 30 seconds"
sleep 30

#External Secrets
./scripts/component.sh -c external-secrets
kubectl apply -f ./tmp/external-secrets -R --server-side=true -n external-secrets
echo "Applied external-secrets. Sleeping 30 seconds"
sleep 30

#External DNS
./scripts/component.sh -c external-dns
kubectl apply -f ./tmp/external-dns -R --server-side=true -n network
echo "Applied external-dns. Sleeping 30 seconds"
sleep 30

#Cert manager
./scripts/component.sh -c cert-manager
kubectl apply -f ./tmp/cert-manager -R --server-side=true -n network
echo "Applied cert-manager. Sleeping 30 seconds"
sleep 30

#Longhorn
./scripts/component.sh -c longhorn
kubectl apply -f ./tmp/longhorn -R --server-side=true -n longhorn
echo "Applied longhorn. Sleeping 60 seconds"
sleep 60

#ArgoCD
./scripts/component.sh -c argocd
kubectl apply -f ./tmp/argocd -R --server-side=true -n argocd
echo "Applied argocd. Sleeping 60 seconds"
sleep 60

#Bootstrap
./scripts/component.sh -c root
kubectl apply -f ./tmp/root -R --server-side=true -n argocd
echo "Applied root."
