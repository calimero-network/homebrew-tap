class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.54"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "43e677b7e795d013877d1f1a982e95c66d71ed651919e6e1140bf88861f6e341"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3c448e17c79c0bdb819dc8778efd2731b79af6aa57733df0696c70a1dc8a9037"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecc302606f320584d1f36f4a88905706018bcaf8676e3c2f3440974672b8fcc3"
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
