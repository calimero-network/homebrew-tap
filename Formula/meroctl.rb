class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "03014ff247f4e10a1dcc8deaccbdcf11d1e5f0e4982c4df59963331e666975cb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f58817b81a05bcdd369f297f73187b1c520fc8f440fefddcb63401c93a5cf65e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c640132e58a99bd86705aa68ea670b444acf483ac5fe621c3bcf95b6f330523b"
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
