class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c5ee5df8ea27684f03a727b7097f4a97b94e236795e00dffa57599804e20ba9c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "52f720d4efcdc1cbb344de887579f02f2a150909a7fe3b5b1c640d7564aa6fad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98874233752e0578acd74a69fcdce2aa8492eb6a6cd878177e5aee6b8330c01a"
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
