class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.88"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/merod_aarch64-apple-darwin.tar.gz"
    sha256 "75f6eb2e574d4e1983b1a8f48dab95a6eeb3368bcad0a8435a596da915e655fa"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e325bcbdea76a4bc12af80fac618f39c5471a93bd438335e9599cc39cfe5bd12"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c74a0f7cc182288821bb59adfe1b835d484aee73e1fca646326a112b5f1db767"
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
