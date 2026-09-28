class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.60"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "55dd827a0881b0bcc1801442027d9d27dbfb774ecdaa34fa7d21f707aba8c21a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "196745c926d2e11494c3e16c77bc3fd35a1cb1dacad5c567ef6a7d1a86419d37"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd766c3fd80720b2c66c214a8d832c45ce7f4937d643815c76c38be7c8c2db95"
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
