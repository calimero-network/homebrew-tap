class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "9f08b5ee8ddb07b435c96114672e6abd178e76df3c87cc3bd66536f4679fa435"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d51f1f29569b6a1b02870f96324af2f89f6d33cc1920662a0cf35ea021dfac1a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15950dc52a63e184a72ea0d2fad9e625fd210190bc97821a1762aadf0c705adc"
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
