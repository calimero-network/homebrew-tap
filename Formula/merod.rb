class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fc114bd82dd2009ce3ca036131d89ee0d15ade59fec5af67a8e01774be67ad10"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6368de37e9b1af943a6c971c8fa4f92fa78ffb8d74e744aaf91df9663f5b299a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e06e99a3c2ae8213f1028d10a67a22d727d504561cf047d5882ecd676b94d475"
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
