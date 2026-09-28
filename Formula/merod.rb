class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.57"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/merod_aarch64-apple-darwin.tar.gz"
    sha256 "066eb81bdf9cd85b016ffc775871f738b0611a485cfed54c2c71a1692bb2e870"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e3719c316177f8f55a4ff3678f46b3ac40725c50dd420c3a551fdf954516522f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "520755b8ef22ac3aeb61cab73a6fb08905127bbb4d8274c9da0b09ee5b03ef78"
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
