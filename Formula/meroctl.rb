class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e1b8f6d685f0ea7b5acbea87676758bce75d8426cc06cdef097f1a181d6a3760"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5019019bd433996d8c4d8daf2e9b0ea5f438272566c7f8b2b5fe92500153c47f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd369bd210c36192e0016d53808380f0d6adbf087520c8f49a131885caef8706"
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
