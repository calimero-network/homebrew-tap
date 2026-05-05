class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "09eda70be705b2477303609a522ad47487c623f82dbe12903cf3c4717e1aef8d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c79ae64d753f8be5df41aeb337c7e263e3bd0f57dc0ba5791a93f25f6f854232"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8b4dad5454d2e713775c08a6c8b03d4d223aad84cc4a00b411c2b351adbbc1d8"
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
