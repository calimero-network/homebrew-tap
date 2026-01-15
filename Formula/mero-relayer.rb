class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "4e1aa8e2647030fd287a380dfe9f8ec7d675541317e786168d3c8d0b08cf8a33"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a95c66c977ebe1b983efa98d98b3d6b1cfc109f61e9baa7f4185dfff4fb40354"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "003c4cb229a7fd8d82d0300b7ed85f9f1230e6c2f6db0e706b2beebc044a019f"
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
