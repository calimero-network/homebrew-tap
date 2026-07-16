class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5538d2d257afbf35641916afb01292f336c2084c424cf91f3365ffc927013fc6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9235319aa6d51824af64918d266289958924ffc96a2e9631338f431bde067fda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b150099eadd5706e5d46fec5aeb49ff22ecaff8a0bd192c59b68b105024668d"
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
