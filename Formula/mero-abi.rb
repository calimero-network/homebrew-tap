class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d08d0c4e28d2792e59ff306de72d38433c0e6887de1f3b75f07288d62d66d2da"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a70d0ecadadb7161d3b09ca614ca386d6b92ad851d5b0c35ed85c082598f37ca"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "471168eaddd636bb44548de2d3c633548629356231257ceb46a5e3c8e5f81d82"
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
