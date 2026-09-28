class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.55"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ec1f380faedbcaba3c81b74c4bb42bb5acee1dac37729ebf72ff804cb75f8168"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.55"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "144154473de6eda066fa57cada7c378242b33b6638dac5eb9df39264963e746e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bb3c2e9b98c3b5231f72965933277bf8ae91398697cc483294e84922488c4d0d"
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
