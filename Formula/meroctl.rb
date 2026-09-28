class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.56"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b5c6b98a636f665a878eecffe7a6ff3cd136d81a480231e7eac0fb83fb33a037"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d20ff663714b63cfab942928f309a92822f06e17bfae4edfab47ca1a4d58bce3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "254511a57197b2da506c68125260dff346b48b583e5e1fd7068b72e3feff5430"
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
