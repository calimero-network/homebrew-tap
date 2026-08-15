class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4c5ff6901fa503957d8073d9c850cda32b823faa2942b08ec83456ed075454a9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "70b53d4b94d9f609663a3c8d821bdc232114923dfaf5b2f5e539fca376a99b08"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4f464d92821e1d8b6f36eb9ec3ed45c092238035bc7531adc6b6893de4022ac9"
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
