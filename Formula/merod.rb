class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3ce6ef3e88b9305af18acdcd4c14ac1de829e15ebd4cd8f9315dc337dc9ee707"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5911d7817e232c01e5ee90880362648a1c6e3959229d57a21b64c88dc9c60bac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f8692efebaaec174cf08d9b00de46342170368f30a3b160467b9235b18b46538"
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
