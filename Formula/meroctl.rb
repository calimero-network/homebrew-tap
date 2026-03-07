class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "22d06b6ce1f91159448bee6528d891fa9d7dda974dbac30ae3a35c602f149978"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "757b281a9f83f2c91e182f67def0bebde994cfb8a089282cfd1f9b1b4c7e4e84"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eeacca7b19e61566f5d5a589929003c76fd262909c57eb2bbe785930c80b5761"
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
