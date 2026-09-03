class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1e412458d10b7050082884b189803e8579d2d0ee6a131392300f5746a5d096f4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "82829a1ff71ec65d247fff53aae935c3c94415dedbcd806218d0c24eee839618"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "78dff36647caea449bdcbc6ab04347c12071a6cc9445e14d986535a57b8f651d"
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
