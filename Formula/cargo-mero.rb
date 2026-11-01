class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "ccffaa6721fa6eec4ffd9d484018ce4b17090ba1527c12b302d0e2ec0be9e837"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d32afc00b3a60bf2295c0db64e9cbe2291ce63494d6d44b2c6b320f74a75552"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0191c46b41fb1620659f976c22c7eeb202de0aff01957e39b22e356b39686021"
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
