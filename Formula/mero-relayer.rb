class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "91be63af4b0d54f436820a595c0ea048fb5b6c21a9fd7b2bba3e4f7e1ea9b540"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b18a98407bdf595560f05e3d18dee31077cf354935f6a20a913562d76fb04dfd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a9fa56b91a85abe535874c024c102dfe5fa167ee81270928f1063fbb4f0abd0"
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
