# GitOps manifest for bookinfo application

For conventions, see this [post by Kostis Kapelonis about GitOps and application release promotion](https://codefresh.io/blog/how-to-model-your-gitops-environments-and-promote-releases-between-them).

## Provision bookinfo application with CLI

```shell
oc apply -k envs/test -n bookinfo-test
```

## Manage this application with ArgoCD

Create an `Application` like the example below to sync an environment to a namespace.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: bookinfo-test
spec:
  destination:
    server: https://kubernetes.default.svc
  project: default
  source:
    path: envs/test
    repoURL: https://github.com/RHC-STP-OSSM/gitops-app-bookinfo.git
    targetRevision: HEAD
  syncPolicy:
    automated: {}
```
