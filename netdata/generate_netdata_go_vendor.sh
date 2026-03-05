#!/bin/bash
set -e

# Configuration
# This script should be run with the path to the netdata/src/go directory as the first argument
SOURCE_DIR="${1:-/tmp/netdata-source/src/go}"
OUTPUT_DIR="$(dirname "$(readlink -f "$0")")"
TARBALL_NAME="netdata-go-vendor.tar.gz"

echo "Entering Netdata Go source directory..."
cd "$SOURCE_DIR"

echo "Initializing Go vendor directory (Requires Internet)..."
# We use guix shell to ensure a consistent go version
guix shell go -- go mod vendor

echo "Creating vendor tarball..."
tar -czf "$OUTPUT_DIR/$TARBALL_NAME" vendor/

echo "Calculating Guix hash..."
HASH=$(guix hash "$OUTPUT_DIR/$TARBALL_NAME")

echo "=========================================================="
echo "Vendor bundle created: $OUTPUT_DIR/$TARBALL_NAME"
echo "Guix Hash (base32): $HASH"
echo "=========================================================="
echo "Please provide this hash to Gemini to finalize the recipe."
