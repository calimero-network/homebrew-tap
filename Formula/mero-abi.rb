class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "18ddfcc3aa05038c60a053ff3fdabba266a6ea07febb53c0a11e663a4b2c4e05"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2a8b8b180dbbd583a2e512c013612b16a97851e9059ff7cccf56011087f2f46"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4392d8de95dc273ebdd1fcbb44fa2cd348eed313ad363ff69cb67aae6c9dc86e"
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
