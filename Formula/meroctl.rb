class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "40741709cf92046eb62995646df33394bad0be6ef096bb8350876e6f0eaba698"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2029b381b16c9775807435295028fbb37361dc3d94b6e2c8329d318a0b5aa896"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7a755513a7d4e06eb07cf3b44bbc3a64203f30df9a0ee85ccc14bb64d6a7374a"
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
