class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/merod_aarch64-apple-darwin.tar.gz"
    sha256 "cdd8cfca4be0c99d9d01f9369b21c4a623d5b95f2f9a0d077ae639df99c90f2d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "465a6c0ab58e90be523e7f5212acf303afedd6eb4b852e6b07927d411fef1422"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.9/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b40c5f61d75ad9962661e4107d8dc851219a6964ed41279b41aa4f787cd69d39"
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
