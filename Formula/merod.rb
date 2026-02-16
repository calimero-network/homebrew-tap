class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6bb491117f6c8b1af5ca49936bfdfcb2d260df3b7ea33eee57c52b2ad934dfb6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e9cb5debd729186110bd9607df0f78bae8e9c46d192232ccacf4f75a87324afc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5061d383e615cc5ad5c6fdd66f53e69abfbceec7e37435f59fe4e0f73614053d"
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
