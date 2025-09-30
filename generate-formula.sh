#!/bin/bash

# Check if version and binary are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <binary> <version>"
  exit 1
fi

BINARY=$1
VERSION=$2

calculate_sha256() {
  URL=$1
  curl -L -o artifact.tar.gz $URL
  SHA256=$(shasum -a 256 artifact.tar.gz | awk '{ print $1 }')
  rm artifact.tar.gz
  echo $SHA256
}

declare -A DESCRIPTIONS
DESCRIPTIONS=(
  ["meroctl"]="Command-line tool for Calimero Network"
  ["merod"]="Command-line tool for Calimero Network setup"
  ["calimero-abi"]="CLI tool for extracting Calimero WASM ABI"
  ["cargo-mero"]="Cargo subcommand for Calimero Network tooling"
)

if [ -z "${DESCRIPTIONS[$BINARY]}" ]; then
  echo "Unsupported binary: $BINARY"
  exit 1
fi
DESCRIPTION=${DESCRIPTIONS[$BINARY]}

declare -A PRETTY_NAMES
PRETTY_NAMES=(
  ["meroctl"]="Meroctl"
  ["merod"]="Merod"
  ["calimero-abi"]="CalimeroAbi"
  ["cargo-mero"]="CargoMero"
)

if [ -z "${PRETTY_NAMES[$BINARY]}" ]; then
  echo "Unsupported binary: $BINARY"
  exit 1
fi
PRETTY_NAME=${PRETTY_NAMES[$BINARY]}

MAC_ARM_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_aarch64-apple-darwin.tar.gz"
MAC_INTEL_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_x86_64-apple-darwin.tar.gz"
LINUX_ARM_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_aarch64-unknown-linux-gnu.tar.gz"
LINUX_INTEL_URL="https://github.com/calimero-network/core/releases/download/$VERSION/${BINARY}_x86_64-unknown-linux-gnu.tar.gz"

MAC_ARM_SHA256=$(calculate_sha256 $MAC_ARM_URL)
MAC_INTEL_SHA256=$(calculate_sha256 $MAC_INTEL_URL)
LINUX_ARM_SHA256=$(calculate_sha256 $LINUX_ARM_URL)
LINUX_INTEL_SHA256=$(calculate_sha256 $LINUX_INTEL_URL)

echo "BINARY_PRETTY_NAME: $PRETTY_NAME"
echo "BINARY_DESCRIPTION: $DESCRIPTION"
echo "MAC_ARM_SHA256: $MAC_ARM_SHA256"
echo "MAC_INTEL_SHA256: $MAC_INTEL_SHA256"
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
  elsif OS.mac? && Hardware::CPU.intel?
    url "$MAC_INTEL_URL"
    sha256 "$MAC_INTEL_SHA256"
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
