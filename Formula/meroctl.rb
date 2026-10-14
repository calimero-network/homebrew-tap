class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.85"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "09e441f0e9f5bf1c8f270d93857903a4a5a5079464612f0ffb1fffd13421ff6c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df0362807a80af6b0a7e6844a16be33d1fa58579cac56fb9f6ae2b138fad575a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d067c26a6f2eff62c157938cc891277663bc7dc2a6f304cb0b6b5d8f2fa47ce"
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
