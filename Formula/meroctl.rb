class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a4f1ddbca3c2629b3031c41e1442cef803c7b93c360c534034ff6d8cee89ea0a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dcaff315fa00766bf36a25d4e2d0d0f541db8bfc77662fb80d7e21f977f741cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c90251c1074b6c96e1a29fde0538d5249765214d31b42d62cda713e00bb39f5c"
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
