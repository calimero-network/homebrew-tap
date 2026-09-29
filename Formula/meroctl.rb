class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.65"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c467b5d2153c1f64f9290c53872dbf0cb7618abe16c6e913aa5419d3b7104676"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a0a30c9ef5544725e3852b1120203644e24a7d4baa343802ffd33440a43c1b83"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3a51d1c6ad7468add4e4ed017e2e6d56a17ce1092a11a23b2176eade24f43d87"
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
