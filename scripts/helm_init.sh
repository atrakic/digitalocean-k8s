#!/bin/sh

kubectl apply -f ./k8s/helm/rbac_helm.yaml
helm init --service-account tiller
