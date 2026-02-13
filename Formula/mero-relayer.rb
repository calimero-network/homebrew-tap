class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "bc0f5189921a5498e23f22cb9effd25a0bb60f7f546ca36f984fbda1a8c76884"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "acc458f599fe0776112250cf36c223f8454ae10f9f5c630aef70eb70beaa7d22"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c6c0abd81a7c280e514585fb509a8cfa1f12f4c89d490ea82989c3ba5cfa60f"
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
