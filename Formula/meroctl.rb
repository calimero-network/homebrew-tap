class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.51"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.51/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "afd7c890b182e77ad1e39650912a3f04c48f8459bd66204bab97b9c3da1aef84"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.51/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b0587c013755c5030bb76f512ab8040f92e1c9232ce0ec8fa67339a559fd7237"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.51/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0cd6d014b53f20246df31c7cfcb3feecb22fd1a93836d0f339b18e0f1cb207c3"
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
