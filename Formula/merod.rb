class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.78"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/merod_aarch64-apple-darwin.tar.gz"
    sha256 "05c5d04f078c803e92254bcefd1efaf1d22c45f6a2f6a3706f742f0e239db608"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7729b8d9922ad1a4490ffdc42aaec5ac22ee86867799840fd0fe0beff775093e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae451226b348da724579debe8ae3984d51b4bf45d29e7152656b8074595a30f1"
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
