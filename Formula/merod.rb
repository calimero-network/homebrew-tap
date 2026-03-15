class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/merod_aarch64-apple-darwin.tar.gz"
    sha256 "bf0d6d08c6c5e925e8553964df93fd06ab0472e76bfae95590c38fd7a76b4009"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "519a63499986d4af3f61f06efcf24b31c93969bc85910e61c3b56d8216fdd8fc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "460bc31e97ec29a84b6aa9b01d648fdb0be9170118b86153d04e11004d605378"
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
