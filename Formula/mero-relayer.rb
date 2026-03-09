class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "b2f53f3f56746fdeb5e2b321f394d5a6d9da7f6feb165d4f5645089d9662cacb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f0fba0d31e5c28afd27eee63d046b1a1542f3287e50e04d688f5c4587f166725"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4cba126c27dd8d04f2f847a415c5537944c98feb42b74ca965f3b629bca2154"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
