class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.56"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2b071b5786a2c8e5ec1edf3c3b6b9105bd2f0840ad482d96ce8f464e120aded2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "00664aad6f1c774f9b198231e6b035b97468ca4ab63c833a1e00dec22e7d8485"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "80f1aa2ab6630c558e793e6703bac338354f5b67473ec12e12bd334af3996311"
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
