class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "9925fdd80cee1ca53ad7d46e26ae131df35e61e8c5a91f1b713e19fc82ff1a26"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "36c8e34d6c1c63c4175efd982c063ca2c6da59d0d53cbaaf73fb1517a0b46fa3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "500cbc5fb0a3711fe317e144b03b459f2fdab73288a58f9a977bd142f8d7adf9"
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
