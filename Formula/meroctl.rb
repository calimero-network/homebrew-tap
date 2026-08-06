class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "398db24004caf2e282bf80711acaf62d9ee4178788a3a6db18e51ba524319c91"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d9ba021585ee0787133ed5f5f72459ba7cc6697e4e9d88fee1efc7ffba999f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6121dc89a22d2d5f4270496fa3ee2cb782f0f87406fe9e77709042be20a498b8"
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
