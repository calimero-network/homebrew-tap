class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8a1941a9388534ca43adcae5c7acfb57a814128b9d227ff2e3ae586d9d246bbf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "835adc46ed93533519f33fac3ad10b18ebf6b26b388ef29b6a62cea0937e13d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c7d51d9763f25945fb189105cedea2d587db493aa0ded376ad6b0e68412ca6fb"
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
