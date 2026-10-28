class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2ea4c234f8809e44fba923b54605f612cf2d982aab37926730c21b4e97d27ef4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b1cd4e45d7f8f6e960d582370935081b29decd180a35dcfcc8e488217187763e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "34666dc3161d4c355007d53c706e62c040d59f581f01dc2a66963bcc57e58fd5"
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
