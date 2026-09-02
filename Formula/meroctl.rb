class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3e755aac6e1672b3aeb8074f983f12c1291eb2bbf8b6fa27e35f2830f20179c9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ad965c2adeee04394acd2d8887434320a30c2c80fe1144f83f0becd3f705065"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d6dbc6aa5ae5bfe8874ee999c3cf942cf8f5415cf9a8077bc084d1c76691bbe"
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
