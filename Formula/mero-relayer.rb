class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "5f6667ff44430d766ad4ad7e1480786af689647c538bd4330db083a8ae2a4b21"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0f14729f28c8b738c07ab89deaa082ac5a8c432565f7ffbce12977eb7e51879b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c56d00c1ece90f7e28fb63812ef28d2e7bfdfa6a5a3795a05f3fd25fc343cdb"
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
