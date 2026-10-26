class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "4a438a42dc5698c9201798b2c6a7b77320729181d09f0e0c76c0e9521fba6bc1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0ba066074c83b14dcb2d07db370d839839017435c63706ee92655aefe41fb73a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15412682b93c52e7364963fcbee9fafe9c192c520d95612687b5b70bfae478f1"
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
