class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.90"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/merod_aarch64-apple-darwin.tar.gz"
    sha256 "33d4cd245e39ce7e6be39bd41209a13237dc45c1c244587e363bfae3b20a7df5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2437d72d48de6b7b5cba139f38fc1046b5e3dcd63ed3616bc946a12ec171d6a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "465e6097027b27ab86a31ad83c63e993c4166f0c45cdc4e4cd1fac517e82400d"
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
