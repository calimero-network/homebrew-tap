class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/merod_aarch64-apple-darwin.tar.gz"
    sha256 "62df52b28b3a30469bd0fca76eba2d6eed0514759f53dc5ada4f1a989dcba307"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9c8b5b98fefe3e823d7d5ffdad62cdaf3c1c748501911d0a86117638dc3eb4c3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "13cd090e03e3bf7a8847e61c13ad604af8858e6f62d6a80e83b17b1ac5dcee21"
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
