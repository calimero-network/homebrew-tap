class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "84d794af5a8fba43abf282c46e38b3755c2555fdd9f760cb0a5ab0e538eb45e4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cb281e011f7e9fc351e47d9cbad7d2c77c106c923fdd454f056131dd1b3d1548"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b7046759246970828f72f44340a506888b760b02f1394e3288a4b4a7e152d6db"
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
