class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.86"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f0b914e9e7ae4b7c16d1457ca667b469361b1483cb05e179e7d50f33bbbe665f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c489390f6c250302d79cee98c894d62384d104f1a57ad65f2f0d5e5e01a0684"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4b437f1ccbe5a228a36db80d8a6b98e0eae1424403c71f2890ee9521f5c9a8e"
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
