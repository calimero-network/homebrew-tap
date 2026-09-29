class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.65"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "625e30fdfe0645d267a48eeb7b6ab60cded5c03c8289310e1d99e98da979efde"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c46b7d23f7ebe6eb8e7f3117ac7e4ee4fcf055ec2c350f2b33c3122ab4ed597"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "521e5c8d661a029c14022c723b4d67ed538e522558cc46f3c0b1335337cc949a"
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
