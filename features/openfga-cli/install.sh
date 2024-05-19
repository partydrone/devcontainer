#!/bin/bash

# This script installs the OpenFGA CLI

set -e

# Define the version and the download URL
VERSION=${VERSION:-"0.4.0"}
ARCH=${ARCH:-"arm64"}
EXTENSION=${EXTENSION:-"deb"}
DOWNLOAD_URL="https://github.com/openfga/cli/releases/download/v${VERSION}/fga_${VERSION}_linux_${ARCH}.${EXTENSION}"

# Download and install the OpenFGA CLI
curl -L $DOWNLOAD_URL -o fga.${EXTENSION}

# Handle different file extensions
case $EXTENSION in
  "apk")
    apk add --allow-untrusted ./fga.${EXTENSION}
    ;;
  "deb")
    apt install ./fga.${EXTENSION}
    ;;
  "rpm")
    dnf install ./fga.${EXTENSION}
    ;;
  *)
    echo "Unsupported file extension: $EXTENSION"
    exit 1
    ;;
esac

# Clean up
rm ./fga.${EXTENSION}

# Verify the installation
fga --version
