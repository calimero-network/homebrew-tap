class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "42d8a661f0a062a8e7beb6ac431afe7cc03cc5c52dbeffc99a49e32e29122d8b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "46a33b785f0fb89a675aabc1a5dd27a8253e8aa9ed9729ed4d450343ba87f806"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6c1cef3163b56b18b105ed24e86470b6129971b8b6771aeda4909eb8c41ad345"
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
