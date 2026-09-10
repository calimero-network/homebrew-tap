class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/merod_aarch64-apple-darwin.tar.gz"
    sha256 "694fdb6b0b2fa088ff6ab6dad721cba59382b7db064209fe70502f515fac3f91"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a9020463cbc8bfe20b38bcd4f73ed3c6a2613c4146f5c2ad6e938c313eecbfcf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2fbd89d55d083192c0b43cb89db44cf96021d8f0bb53b3b285a284be3fb95320"
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
