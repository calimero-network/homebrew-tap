class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d0a855f0d9010e541369e641634d34b00e9e152bcebe704ee1aad61d4fa3636c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "130a690f767f5f89832faf95c0cff077ac9bfd2cd362d83cb9840ec1893e2e11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efa00d051fbed5a7f8d857081f3a9b07729b6cfd7734c3adcdb32cc40fe1f225"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
