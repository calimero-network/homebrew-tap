class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.73"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3b858827946d0a2f086f0bfe4c66a9055bafc61d4e9e0fa22b27c18b080b79b7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "57ce90f47c975b27ab3614659089fe56957a4c4449156cf59caa9159fede8053"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a4f4af9d3c487f959564b6713c905bb6365013a926e13bdbffbebe1593c849f4"
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
