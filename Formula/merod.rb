class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/merod_aarch64-apple-darwin.tar.gz"
    sha256 "986d6a86dc308ac5ea524ed9cc3de5a4fb987659f45d98e42fab31bfa2fcc168"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4be14dd6fe6f8ee0cb023efa81c93413852b92e6d486d264dbd326ec9425ccce"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "559cadba376e5dda12b1c343511855a2a2b400daa6bffb3fdc295fae8859f05d"
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
