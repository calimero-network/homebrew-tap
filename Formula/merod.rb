class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/merod_aarch64-apple-darwin.tar.gz"
    sha256 "0b7d82fa536803132590fc26b2c9f9bc02bda0e9bf4fca3c4de33e168303c03c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0962c79fe7b7bf5a5b217d907cee0517a197230c30b78a76239aadc9c4e22f89"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba7f6cde79a2b314cae556a667fff98b2d2ef1517cb337928757bca0e6390b03"
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
