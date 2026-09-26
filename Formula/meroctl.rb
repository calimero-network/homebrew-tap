class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4a8721cad715122ab46d2e3ff979da54b48c3a2cf66c8b141eb19f4d7d458507"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a9fc5131960c91766adc6c481a2d7e4d03f002b6e90e04b30837eb670b74ca56"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f523c6b6198399d10ef9a54b9cf19b0571cb2756f857685028d5334d3699f380"
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
