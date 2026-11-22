class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/merod_aarch64-apple-darwin.tar.gz"
    sha256 "34c98e7c6624c14041603bf1b605f7e1f0f62e11d18310b5e2be476401bfa35a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.34 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dbe09543b74f167fb723391f1ae302d902a718d421382374ce90d18c88a4542f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c45681438e4e72eb929f69a29deac83e215289c84fc65e94fcff2d3e3f596cd"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
