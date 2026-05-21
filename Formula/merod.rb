class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/merod_aarch64-apple-darwin.tar.gz"
    sha256 "b87874cfd20e41c1228f2a645cdb26435b0aeaf94c237dbe0a32437dae8b0296"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c74786dff7b336f097adb30695bea43168502ce088dba81531bc4966fd7ceac3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cc4a51a52341c33f8b2a3e1ece44b67707152a57dec504e0de6bb55e84614db3"
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
