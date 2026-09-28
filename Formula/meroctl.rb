class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.58"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c794c5fe8ee809d8114a5471687f516c84ff405fc57407122f35d2edb94adaf1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2cd74d65594c063b53554fe795d6ce16f4edf2928f95284c0c4572dfa1a2c635"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b61a42886805fd4438c27b68a680791b853c1b9124737d166d7a197507f6a329"
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
