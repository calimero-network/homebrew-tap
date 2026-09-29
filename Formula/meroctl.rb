class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.62"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "77bd54d8f6af97cf25ed487cceb4a22a42f2c0df8b9097db7f1bfb141819bf1f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ecfde64007f1e222a6c9a69887b97dcb2afde1bd048661a0c80b2af2348c8b84"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8a0e7eeeba482f3baa94e042470129eb44525531a90e26318c4d7bb77c1dd74d"
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
