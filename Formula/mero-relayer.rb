class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "e794d4aa78e249a23212fbc3c62cee145379eea9055da0f6259c1eba6497f349"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dc94733116d07de0615c91b13344e396a19d48d1ceb62e93856c7bfd1297cd90"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c314d64fc5fe447f5ba6ad2ece76c113388982691c2116f723a44994d08fa48"
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
