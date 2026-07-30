class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8760881b0bbdf1a5a17293c7899b710476eb28988adb1b112e70539c59cdb4c1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fd719105d360b5de24dc7df9e534902e4636ccc277b0128028d20f1120f26875"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "980b2520f6176460adc91ee80111f367f1b82ff2a44fbffac80be103e3ba9f23"
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
