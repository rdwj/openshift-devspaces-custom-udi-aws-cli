# Extended Universal Developer Image (UDI) for OpenShift DevSpaces

## Extending UDI
 
The Containerfile included in this repo demostrates how to extend the official UDI image with extra tooling for Red Hat OpenShift DevSpaces.

## Building the Image

Build the image and push it to Quay.io:

```
buildah bud -t quay.io/pittar/devspaces-udi:3.4 .

skopeo copy containers-storage:quay.io/pittar/devspaces-udi:3.4 docker://quay.io/pittar/devspaces-udi:3.4
```

## Using the New Image

To use this new UDI image in your own workspaces, specify the image location as the `image` in the `tools` component of your **Devfile**.

```
schemaVersion: 2.1.0
metadata:
  name: demo-project
components:
  - name: tools
    container:
      image: quay.io/pittar/devspaces-udi:3.4
      memoryRequest: 1Gi
      memoryLimit: 3Gi
      cpuLimit: 1000m
      cpuRequest: 500m
```

When your workspace starts up, it will be using your extended UDI image.

