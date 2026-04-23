class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "07fea9c4f111c712f2e3c7298cdb704176eb7808aa36fd143cc6ea93cee730e5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b4af16c55f8dcc4f4b748b58bc60a189dffc04b9b6baf770e182b1411e5c969e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d3402f6ca23ed6695c959404044b78fb9f4a84cb0a17ab5c5780fd94729ad4d"
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
