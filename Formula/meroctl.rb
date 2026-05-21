class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "32bf2a86bcd11a16f276bd0e4f42789a052a106179dca65e6dcc166b8340b417"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9ed3edc621345d3aa50b671a591edb8876dcb76b14195d8aa44cf2d82f598e45"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c081510e994414e49d5e45435bf71873476fdeb8c470fc3325e8c54370561846"
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
