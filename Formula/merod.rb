class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c5e9e88f3c270228040f6055a65a7d8e780f5e7e2d7c0a5a1263cd28dcab9d62"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c72ce9b58af4979dd6658e9d17a91a550689c3d80e6f951df15b3497f73b3bdf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "90269799a18afdd19c6ceab0247856a1d3d98bcf74b79d82e1bea08d8aa323f3"
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
