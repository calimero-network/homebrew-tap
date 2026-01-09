class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "a7cda9179c3dd619727fbbd6fca6be9f6bfe9645cf786ec64b45682f2f415496"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "40789a74a2f57070f7834490b0ddbc840998ca91ca1bf8b45d43c6abc5f3c145"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a6e2221e87ae551261abe24507e7576c3cad0f4b14ddc601d98a9b7786084f8"
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
