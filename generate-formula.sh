#!/bin/bash
# Writes Formula/<binary>.rb for a calimero-network/core release:
#
#   ./generate-formula.sh meroctl 1.0.0-rc.25
#
# core's release workflow runs it for every binary in its HOMEBREW_BINARIES and
# opens the bump PR. Each platform's archive is taken from the release when it
# has one; a platform the release does not build gets an `odie` that says so
# (merod has no macOS build before 1.0.0-rc.25, and no release builds Intel macOS).

set -euo pipefail

if [ -z "${1:-}" ] || [ -z "${2:-}" ]; then
  echo "Usage: $0 <binary> <version>"
  exit 1
fi

BINARY=$1
VERSION=$2

case "$BINARY" in
  merod)
    PRETTY_NAME="Merod"
    DESCRIPTION="Calimero node: runs apps, and a development cluster with merod local"
    ;;
  meroctl)
    PRETTY_NAME="Meroctl"
    DESCRIPTION="Calimero's command line: make, ship and run apps, and reach nodes"
    ;;
  *)
    echo "Unsupported binary: $BINARY (merod, meroctl)"
    exit 1
    ;;
esac

BASE="https://github.com/calimero-network/core/releases/download/$VERSION"

artifact_exists() {
  curl -fsL --range 0-0 --output /dev/null "$1"
}

sha256_of() {
  local artifact
  artifact=$(mktemp)
  curl -fsSL -o "$artifact" "$1"
  shasum -a 256 "$artifact" | awk '{ print $1 }'
  rm -f "$artifact"
}

# One `url`/`sha256` pair for a platform the release builds, else an `odie`.
platform_block() {
  local keyword=$1 condition=$2 target=$3 label=$4
  local url="$BASE/${BINARY}_${target}.tar.gz"
  if artifact_exists "$url"; then
    printf '  %s %s\n    url "%s"\n    sha256 "%s"\n' "$keyword" "$condition" "$url" "$(sha256_of "$url")"
  else
    printf '  %s %s\n    odie "%s %s has no %s build"\n' "$keyword" "$condition" "$BINARY" "$VERSION" "$label"
  fi
}

MAC_ARM=$(platform_block "if" "OS.mac? && Hardware::CPU.arm?" aarch64-apple-darwin "macOS (Apple silicon)")
MAC_INTEL=$(platform_block "elsif" "OS.mac? && Hardware::CPU.intel?" x86_64-apple-darwin "Intel macOS")
LINUX_ARM=$(platform_block "elsif" "OS.linux? && Hardware::CPU.arm?" aarch64-unknown-linux-gnu "Linux aarch64")
LINUX_INTEL=$(platform_block "elsif" "OS.linux? && Hardware::CPU.intel?" x86_64-unknown-linux-gnu "Linux x86_64")

# A release with no archive at all for this binary is a mistake, not a formula.
if ! grep -q 'url "' <<<"$MAC_ARM$MAC_INTEL$LINUX_ARM$LINUX_INTEL"; then
  echo "release $VERSION has no ${BINARY} archive for any platform" >&2
  exit 1
fi

cat <<EOL >"Formula/$BINARY.rb"
class ${PRETTY_NAME} < Formula
  desc "$DESCRIPTION"
  homepage "https://github.com/calimero-network/core"
  version "$VERSION"

$MAC_ARM
$MAC_INTEL
$LINUX_ARM
$LINUX_INTEL
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "$BINARY"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/$BINARY --version")
  end
end
EOL

echo "Formula/$BINARY.rb: $BINARY $VERSION"
