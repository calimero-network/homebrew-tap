class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "98898a8fd98961c4a664dddf6e64d09bc47c8f211edc94b398fb4296fa501550"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9226f2a29427d9a75ceb756eeb347e3a5427d0179f71efc38dcc72172e067443"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.5/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44583497de1ca0e5f0736e5798e4fd85a0745accf408adcb2ee4da96cd7444e1"
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
