class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.61"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6b5d67ced9bad69911eadca2b8475c3ae5958c005a600eae2fe7c6e8fd069833"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.61"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d5ad29faf06204598964e6b4c2098c0360591768dce8d149adb30d6a4462b84"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1afed31cc0b9568ac815dd82fadd9b798d9f2c313ec302266d8b019397cbb769"
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
