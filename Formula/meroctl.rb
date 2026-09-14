class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "5462ea50a2b1bdd1e9a26300e9d11b8302fceb68230dd4252dbf083220c74c3b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7a224bd1e2da3f5c40302fa246ad378739eb7e32ab42867fbb32e263b5e6e016"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aebaf6d6d5ff94849c71079378564687103ea34ba7470042186503ef01cc3c59"
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
