class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2199ebaf644c73da1da2c54852cdc68d177e977bbb7c5fc0e2757845fd59558d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b96e0f39b6d0a2e6056ac77897c34f2e5eb1700f8c8cb3aa44fddb770eea639"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "52a959f4a920a266e37f5520fd8335839a56c7ee186a99e7a9c2316517054d5f"
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
