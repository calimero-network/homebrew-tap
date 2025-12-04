class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "1d7ca880094bb4456d2e7f976614d43b2af56487aa9111b560924ee10b63c47e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64421aeade941e085e718673c376f2ad91a161244c6c72e5de81247ca1972639"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f730f6e77b848bc205abe58a0813b7e05e5773ae20bd4ff231b2e71a2b30c0a9"
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
