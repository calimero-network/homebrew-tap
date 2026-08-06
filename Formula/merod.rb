class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/merod_aarch64-apple-darwin.tar.gz"
    sha256 "233fa3004bc671912f2a69e0de9a7d3b9fa0d7a9b21c98d7f5c9d0dfb60ac9a3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c20540a88b599a8de4b7e1b4e493a2d628882d28843624b85965d1369de390e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8fc56b1f0cfad5ff12f7479e874bbbb8ac9302b911b48dfb7fb451a0f5fd3688"
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
