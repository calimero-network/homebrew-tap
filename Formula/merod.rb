class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/merod_aarch64-apple-darwin.tar.gz"
    sha256 "814d9e4ca1a8cdccea82919e9dadae58e1f5e5fd3d4d0db985da907efc464238"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8a86e98c323f114f7e99fbd936dcd0b1773d5cb543537820ee986f4808c1f505"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b80b620df7ad8f2ffa85c561c91fc5c36c3fe19fa1fc9f3c4a4205587a0f644"
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
