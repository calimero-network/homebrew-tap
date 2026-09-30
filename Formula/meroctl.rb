class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.67"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8bf8f8704a637ea5ad540e0159a5aa2bed86e1f72011a8d75ebe2630f4a13f38"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c87b096f3c170f4f6d5e2b4fcf238ef5607e90a375cfbdb9cd492540d37a7314"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "756ce939d71abbe80feba291cc83464dacc833b7c0b11b888d25a64bfd399094"
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
