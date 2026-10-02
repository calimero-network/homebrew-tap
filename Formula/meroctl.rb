class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.76"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "09baebfbf8964d9c2ca735e838450bf0bd8bd5373831046bd4b1430c1e106cc1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e6160b8494ee32b23142eb7010743c5ed7076e5a6ee0b72fb722a5c5e3097db5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "410f320d036fe6e55b124e0156640a440f41bf765b5ff8ab26c71f3a33efa1a9"
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
