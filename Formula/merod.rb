class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/merod_aarch64-apple-darwin.tar.gz"
    sha256 "aa5b2bb9dd2956b8995b2a6201441a462f40f96e1a5c2bcd4e923f166744ee67"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "359bf7da0e573a6d32ef0d6c57f85bec3b6c67277224cc8a48c6406467737b60"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "926d2bbb6333792673325cfd3a84db0460aceed722db1a000f268e5aa223e8fb"
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
