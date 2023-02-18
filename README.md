# Extended Universal Developer Image (UDI) for OpenShift DevSpaces

The Containerfile included in this repo demostrates how to extend the official UDI image with extra tooling for Red Hat OpenShift DevSpaces.


Build the image and push it to Quay.io:

```
buildah bud -t quay.io/pittar/devspaces-udi:3.4 .

skopeo copy containers-storage:quay.io/pittar/devspaces-udi:3.4 docker://quay.io/pittar/devspaces-udi:3.4
```
