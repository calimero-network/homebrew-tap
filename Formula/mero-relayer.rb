class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "94745d1becea1ed6c07d30df3270d81f11b767a6e0433d588164d7913369b171"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3180262b5b7ce3e859f7f83848e23a5f8b11d88619811159453c3f3ff90f5238"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2fd9806f59ed025b0c68f91c59b412109cba9dd5d2611a0e9b163fd165a0f52e"
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
