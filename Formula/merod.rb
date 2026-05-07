class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d1ef12bc9318e5df1635037b45e2f5028b30a4b8e74014d6cf5bbb4e1bd92d3b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4f60d9ab924cff416537dca5fc34b98ecaffc2de9e895e51cabf1e3e20f28711"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "231c6aba175efb82d5b3b396f925e5ef8a25ef8e31e7b61144350391c1e89f13"
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
