class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "34abfdfc072bd26e962422f9120a372180102b4d3c71cc586e2c5fff0d23a49f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "37027fb5f1cb407a7893e4ea69f2c594ed8507e04537aec8617477404f73fabd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f2054fa4c13eba8767040294eeaa1fdd1c7965d9b84e27fd584969125f07495c"
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
