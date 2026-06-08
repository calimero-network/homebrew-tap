class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/merod_aarch64-apple-darwin.tar.gz"
    sha256 "46c78f43d3ca6a84cc0387674131b6b890a2cbc856cea1784047b209ca408919"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1a666dc37dc324ca393455f26c86d35efef892b666afd6d0edf479fef6bdf327"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "83bd64f3cd2d3979b5621516177f151c21fa7c6929016de6d8c5843f507a66e6"
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
