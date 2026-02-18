class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d37537ecc7295d5db88d129ec4c202528879e2e6a484e8b7a591fab15ec377a8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1508cc244541843911b886f21a594b0d068c421e9b84b41d4a3b24d8a5ddcadf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a01a88515c686af45798447a08be009670fb6b04d376b457209b29b6248bea5d"
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
