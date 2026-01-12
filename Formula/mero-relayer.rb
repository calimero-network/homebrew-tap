class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "5951e1c80cd2dc4b4e8e950385aa2cd6e16e2a5bd49a4a95322dff02b70ea61c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2da34858cb31c763bd86711554ec891b3575f0f86dfed417893b273833e8b895"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba2936d7ee0dc6e52120a65a5c403d4dfe6b7207fa60039fff36146eea4533d8"
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
