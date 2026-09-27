class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b1cda68b188976f0272c6bda95b26cffafec5432130b3744ce38d07b4c2a5012"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "421494ba2729482ce2f26115cfc6d4c62da35caaed5e86819767e17dbbdeb68e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8b7cc594545148b193707d27b3cc4ffcdca7a28eabc5e7f94f5f6c0a29b9dd00"
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
