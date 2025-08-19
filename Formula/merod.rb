class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5ded2f2238fb1cc1540f4fe8703296111230704d2f52e188a734cab805372e75"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/merod_x86_64-apple-darwin.tar.gz"
    sha256 "ab4b07e03add1a471bc278570796126df2a35a4b9a14efb43357643f665fbd53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ac3f9cbc8921ad664afa66510824da70b219c974758e79931b31660c31e59263"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.6/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "54519a528f0bad48e0153c5cb3055385bbb60d178fe4def611cbd178e57ae164"
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
