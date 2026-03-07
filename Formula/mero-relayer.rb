class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "965dc111bf392cfe755235685553bb3a41a0f4891dea5fc976cf4f8b81351d17"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9404188cc034a6c21b243ca2cb5205d914627c53ab18a962b446191365788667"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "37098bfdcf6d4f8ad7872d07e0d50e402629604ff16fe396825afdf7466904ce"
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
