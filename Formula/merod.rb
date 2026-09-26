class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ec4fb2cf8a7375abc3dfe81416c3d1d11abc4129cc0d288b8a830e7b56629669"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "abe8f48c6de8d731bf7d4d43637232d90a906bad31f969102ba033f36697e995"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "48acea1dd41410fbbf7d8e9e5bba46d13b291ace573fe2d0ecf02a14d4554e26"
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
