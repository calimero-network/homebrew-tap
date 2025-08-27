class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d384ce6deaf516626e618ed9d2330838fcfdad81a6b7977bf4528ab93ae7ab69"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "8513db45366d3a051d891ec9e234e8b59415a2906e7042dd050f117b56bce64f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "537d4f1a725ef4a3e49f8d524b9943b2e65bfeb6fa005d57ab886e8e896014ff"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6522f6afc962cc4eea619c86cef9fbec1b1e4fd43fa674b5d0b24fa8bdce2e3a"
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
