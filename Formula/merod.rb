class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/merod_aarch64-apple-darwin.tar.gz"
    sha256 "03f3ebe6634cb8e2250ae1cd60566f36c141fbff607952d9945cc9fed09f3333"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7216d9ce7bcd0945199907c6d1442b4b42404b400f0f51b35a1d39dfeb27c028"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "24d0edb3b108796671512cc7922964f2af2ca15afd40c943e10bae025ea18d19"
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
