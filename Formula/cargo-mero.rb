class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "d076001e7ba216985be1ce301169413f697e75e600b25deaf2ec2a175d98f44b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a3d846c906c2b15e605098c21f163649ae37ff5650ab9c59463e45194db601c4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "454db30e7b7381c1c9a77336c7d4ba938319f0afbfe7438f67718de170f12fef"
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
