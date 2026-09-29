class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.65"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c5af92ff53421c2c435e50e4fba691e30c440b2a2edf0d8ad4a82d81438b3a7d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2ca48bd31225c35e6969d5e6fe2400d7c5de6587919fd5cecab7a2aa292f6b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d5de9384b52c7e59ac638cc65912603a4610a1965bec76fba6cc8e7a082b380e"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "MeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
