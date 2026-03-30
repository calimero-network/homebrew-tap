class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "15e832ce1da6e6d601287995baebc3aeb016ebfbeac03c1f910f430f06847520"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "09aa412098d3a7f46662d13af4804ffed96e9b30a3cf6ea3b5bf114771600704"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2bdfad6ff2328d7686a11257211df0fb73af38f61a6640b58a38c04a5530d8e0"
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
