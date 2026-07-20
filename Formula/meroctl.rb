class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "926d20001e49eeec1c8da2765cc8b32d158232a0863b3bf3c47ce7c7ca7c00b0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c01b41a9f093dce4c3f989610027c29d46462f6a84632f230260a98c2f5a006a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d90cfe0e3b469c2e8f8409b14595180161269dd2ef1de7676c5f89d3f509e3c3"
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
