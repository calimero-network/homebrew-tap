class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/merod_aarch64-apple-darwin.tar.gz"
    sha256 "31507b2b931f39d90c494a2e416fcaadc778de382ce25c307c549e36ba1cdcf4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "63ee8a4980ac280459677990dc84ccffe432019118a563b00b5f639da4270622"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc706b451ca401912fd3aa750ea93ebf6297f745715a6ce80d6b2ea63ca0c7ff"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
