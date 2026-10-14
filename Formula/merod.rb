class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.85"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/merod_aarch64-apple-darwin.tar.gz"
    sha256 "69f23a706271d9cb71e98d807aff31c03e540d25f1f4a3655fae11cbdcd250a4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "28dfba06892f83755a8a832fad1e53e0f7b461d5374d2c81ca55ddf04baf30e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a73d879e4e74a336d2883702d68e7525b141b9ebc3ceac19d9ab549e3b48cfb3"
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
