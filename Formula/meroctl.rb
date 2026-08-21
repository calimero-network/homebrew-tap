class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "372acd35d8e0c9160d8a8bde4c97b7a3e73917c3269de769e5317182fca03f4f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b42c7b5c05b4d4c9e84264d9a234176be3b4c03cd23832f21fc7e1ddee6004f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a25dcfdababc07035e6f6c0b002a46c1ced703b6923cc06f25df9fc45e1552d9"
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
