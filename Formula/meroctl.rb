class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c118416f621b6b1b4fa428c452d0b7f3e6f422374e81d18213f346d65dec460d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e59192e60709af5cc9c6f834f14c7b8526fcdcc2db9043a379067507be72f15"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bb34572d064f0640d2806d0bbd93f17371c4ef953c52a7c5f7a36fbb8d858bc5"
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
