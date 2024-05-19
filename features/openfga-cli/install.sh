#!/bin/bash

# This script installs the OpenFGA CLI

set -e

# Define the version and the download URL
VERSION=${VERSION:-"0.4.0"}
ARCH=${ARCH:-"arm64"}
EXTENSION=${EXTENSION:-"deb"}
DOWNLOAD_URL="https://github.com/openfga/cli/releases/download/v${VERSION}/openfga-cli_${VERSION}_linux_${ARCH}.${EXTENSION}"

# Download and install the OpenFGA CLI
curl -L $DOWNLOAD_URL -o openfga-cli.${EXTENSION}

# Handle different file extensions
case $EXTENSION in
  "apk")
    apk add --allow-untrusted openfga-cli.${EXTENSION}
    ;;
  "deb")
    apt install openfga-cli.${EXTENSION}
    ;;
  "rpm")
    dnf install openfga-cli.${EXTENSION}
    ;;
  *)
    echo "Unsupported file extension: $EXTENSION"
    exit 1
    ;;
esac

# Clean up
rm openfga-cli.${EXTENSION}

# Verify the installation
fga --version
