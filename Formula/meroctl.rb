class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "80b0bd3c947f84655ca4863d1ce373583fd3883e0f710d60305b0106080a19d8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "86a19cc3fad653ba69be3dcb502993810ec76cfe0a3fd48ecdd2cd371d723a01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c2b2815a939007423960a0be49a2c2aac03d06843640efb22313a4af46a777cf"
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
