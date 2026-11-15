class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2dce192d552009097cc2026a9912b31459add8c93a63cb8fde767b1dfb060b9f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.27 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "99f761e60cfe7983e461a528774158d934e9d286471c5580d62e8c83773fc68e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d5e006e225cf86fdc6392a97d9bc2c1836428045dc6650981fed2b44a5294365"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
