class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.58"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1b4a88d543c2c7301759c402236e4f20070c57bebc1c8f76ca94b5d70985d97c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "45a068373e9e3769e8c847b803e6fe4ac86d3510b8b41c927280c6d89234fa7c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e255b6feb68c2ba33aa4f639d994090bcbca6ecb3e2cb4e120a341cb087be48d"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "CargoMero CLI", shell_output("#{bin}/cargo-mero --help")
  end
end
