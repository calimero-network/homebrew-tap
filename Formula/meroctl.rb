class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.71"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e054355b53af436e8fc0a5a3c8f2e530ce4fee6d31800b59d52d85619ad2b7d7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8805e7eb58d04be3ac0e6ce4972f1d6aca5667d1bffe3bbfe9beb31a6346aeda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bc221e006024b3d88d01520410711dda2376dac0db2d3cfca233296dc3395027"
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
