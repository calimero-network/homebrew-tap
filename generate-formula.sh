#!/bin/bash

set -euo pipefail

# Check if version and binary are provided
if [ -z "${1:-}" ] || [ -z "${2:-}" ]; then
  echo "Usage: $0 <binary> <version>"
  exit 1
fi

BINARY=$1
VERSION=$2

calculate_sha256() {
  local url=$1
  local artifact="artifact.tar.gz"
  local sha256

  curl -fL --silent --show-error -o "$artifact" "$url"
  sha256=$(shasum -a 256 "$artifact" | awk '{ print $1 }')
  rm -f "$artifact"

  echo "$sha256"
}

artifact_exists() {
  local url=$1
  curl -fL --silent --output /dev/null "$url" >/dev/null 2>&1
}

declare -A DESCRIPTIONS
DESCRIPTIONS=(
  ["merod"]="Command-line tool for Calimero Network setup"
  ["meroctl"]="Command-line tool for Calimero Network"
  ["mero-abi"]="CLI tool for extracting Calimero WASM ABI"
  ["mero-relayer"]="Service for relaying requests from Calimero to external blockchains"
)

if [ -z "${DESCRIPTIONS[$BINARY]-}" ]; then
  echo "Unsupported binary: $BINARY"
  exit 1
fi
DESCRIPTION=${DESCRIPTIONS[$BINARY]}

declare -A PRETTY_NAMES
PRETTY_NAMES=(
  ["merod"]="Merod"
  ["meroctl"]="Meroctl"
  ["mero-abi"]="MeroAbi"
  ["mero-relayer"]="MeroRelayer"
)

if [ -z "${PRETTY_NAMES[$BINARY]-}" ]; then
  echo "Unsupported binary: $BINARY"
  exit 1
fi
PRETTY_NAME=${PRETTY_NAMES[$BINARY]}

MAC_ARM_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_aarch64-apple-darwin.tar.gz"
MAC_INTEL_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_x86_64-apple-darwin.tar.gz"
LINUX_ARM_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_aarch64-unknown-linux-gnu.tar.gz"
LINUX_INTEL_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_x86_64-unknown-linux-gnu.tar.gz"

MAC_ARM_SHA256=$(calculate_sha256 "$MAC_ARM_URL")
LINUX_ARM_SHA256=$(calculate_sha256 "$LINUX_ARM_URL")
LINUX_INTEL_SHA256=$(calculate_sha256 "$LINUX_INTEL_URL")

MAC_INTEL_SHA256=""
MAC_INTEL_BLOCK="  elsif OS.mac? && Hardware::CPU.intel?
    odie \"Intel macOS binaries are not available for $VERSION\""

if artifact_exists "$MAC_INTEL_URL"; then
  MAC_INTEL_SHA256=$(calculate_sha256 "$MAC_INTEL_URL")
  MAC_INTEL_BLOCK=$(cat <<EOM
  elsif OS.mac? && Hardware::CPU.intel?
    url "$MAC_INTEL_URL"
    sha256 "$MAC_INTEL_SHA256"
EOM
)
fi

echo "BINARY_PRETTY_NAME: $PRETTY_NAME"
echo "BINARY_DESCRIPTION: $DESCRIPTION"
echo "MAC_ARM_SHA256: $MAC_ARM_SHA256"
if [ -n "$MAC_INTEL_SHA256" ]; then
  echo "MAC_INTEL_SHA256: $MAC_INTEL_SHA256"
else
  echo "MAC_INTEL_SHA256: unavailable"
fi
echo "LINUX_ARM_SHA256: $LINUX_ARM_SHA256"
echo "LINUX_INTEL_SHA256: $LINUX_INTEL_SHA256"

cat <<EOL >Formula/$BINARY.rb
class ${PRETTY_NAME} < Formula
  desc "$DESCRIPTION"
  homepage "https://github.com/calimero-network/core"
  version "$VERSION"

  if OS.mac? && Hardware::CPU.arm?
    url "$MAC_ARM_URL"
    sha256 "$MAC_ARM_SHA256"
${MAC_INTEL_BLOCK}
  elsif OS.linux? && Hardware::CPU.arm?
    url "$LINUX_ARM_URL"
    sha256 "$LINUX_ARM_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "$LINUX_INTEL_URL"
    sha256 "$LINUX_INTEL_SHA256"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "$BINARY"
  end

  test do
    assert_match "${PRETTY_NAME} CLI", shell_output("#{bin}/$BINARY --help")
  end
end
EOL
