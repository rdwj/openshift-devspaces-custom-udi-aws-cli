# Extended Universal Developer Image (UDI) for OpenShift DevSpaces

# NOTE: This is a work in progress and does not currently load the aws-cli.

Forked from pittar/openshift-devspaces-custom-udi

## Extending UDI
 
The Containerfile included in this repo demostrates how to extend the official UDI image with extra tooling for Red Hat OpenShift DevSpaces.

## Building the Image

Build the image and push it to Quay.io:

```
# Build the image with the name and tag we want
podman build -t devspaces-udi-aws:3.4 .

# Tag the image with the Quay.io repository URL
podman tag devspaces-udi-aws:3.4 quay.io/wjackson/devspaces-udi-aws:3.4

# Authenticate with Quay.io (if you haven't already)
podman login quay.io

# Push the image to Quay.io
podman push quay.io/wjackson/devspaces-udi-aws:3.4

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
      image: quay.io/wjackson/devspaces-udi-aws:3.4
      memoryRequest: 1Gi
      memoryLimit: 4Gi
      cpuLimit: 1000m
      cpuRequest: 500m
```

When your workspace starts up, it will be using your extended UDI image.

