class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/merod_aarch64-apple-darwin.tar.gz"
    sha256 "aa53303c31953d05a957b10e9d78a85c06a4ab34c077339b0dc5f8181d67021a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c45ad682ba9be86fbec6a93bc8883e0b9a99d1447aa4037743a0295170a004c3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9ab5940459e0604fedb49daaede97a4de7281979f0c822c30b2e73773f929ef"
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
