class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "fe266e8046d2ebb209e67ba02db47e299ce44eed0a170f6990d3e858b93a3841"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2ec13e6d0fc80732901248769535da2f87dc4857d22bab19e5f6e092f4c4910f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e31a364a044c137f3fdc919665a988afc03342edef8fa0163a49cc05de222d34"
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
