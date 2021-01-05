#!/usr/bin/env bash
KUBE_CONFIG_PATH=$HOME/.kube/config
K3S_CONFIG_PATH=/etc/rancher/k3s/k3s.yaml
CM_VERSION=v0.15.0
NS_CM=cert-manager
NS_RANCHER=cattle-system

if [ ! -f ${KUBE_CONFIG_PATH} ]; then
    printf "File not found: ${KUBE_CONFIG_PATH}\nTrying k3s file: ${K3S_CONFIG_PATH}\n"
    if [ ! -f ${K3S_CONFIG_PATH} ]; then
        printf "File not found: ${K3S_CONFIG_PATH}\n"
        exit 1
    fi
    export KUBECONFIG=${K3S_CONFIG_PATH}
fi

if [ ! $1 ]; then
    printf "Argument(s): <rancher-ui-hostname-without-http> <optional-rancher-image-tag>\n"
    exit 1
fi

if [ $2 ]; then
    printf "Rancher image tag provided: ${2}\n"
    docker pull rancher/rancher:${2}
    if [ $? -ne 0 ]; then
        printf "Invalid image provided. Valid images: https://hub.docker.com/r/rancher/rancher/tags/\n"
        exit 1
    fi
fi


kubectl create --validate=false -f https://github.com/jetstack/cert-manager/releases/download/${CM_VERSION}/cert-manager.crds.yaml
kubectl create namespace ${NS_CM}
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager -n ${NS_CM} --version ${CM_VERSION}
kubectl rollout status deployment cert-manager -n ${NS_CM}
kubectl rollout status deployment cert-manager-webhook -n ${NS_CM}
kubectl rollout status deployment cert-manager-cainjector -n ${NS_CM}

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace ${NS_RANCHER}
if [ $2 ]; then
    helm install rancher rancher-latest/rancher -n ${NS_RANCHER} \
        --set hostname=${1} \
        --set rancherImageTag=${2} \
        --set rancherImagePullPolicy=Always \
        --set replicas=1
else
    helm install rancher rancher-latest/rancher -n ${NS_RANCHER} \
        --set hostname=${1} \
        --set rancherImagePullPolicy=Always \
        --set replicas=1
fi
kubectl rollout status deploy/rancher -n ${NS_RANCHER}
