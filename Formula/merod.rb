class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.84"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/merod_aarch64-apple-darwin.tar.gz"
    sha256 "38b3a6aa9a85f38be174cdd2f777f30d9bea931dac019c24e27633881b71fb74"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c10bb45beb49f211585104cc7735b97a7e37187acf946a218f9a5796812dd4a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c207bae8883c78b9d2f93756fa3ffdf8fe59d858957669040dc2566e396c24ee"
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
