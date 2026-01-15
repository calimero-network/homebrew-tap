class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "00aabe60834f5f54bb739384fd0dd133c7055a101f83fb4113d7787b3ac30300"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4df985d9030ea584cb02710bc08458e91ee256f82f7409917622137edf6cdda7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "219165f468bb6b22a080988d804c2372edcdcf0552ac6b92d449ffa0284de5bd"
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
