class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a78f49068cefd9af3865e2eedc3b34c3fc55df39d3fbd0387fa350e43952584a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a987d71105fde8846420cbe23fd63cb0e5bebec73469f006772b47acd7b4eb97"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8196d374ab9f1331cf5bec0f8f4a86355f5da333777407c188d51fbdadb7f463"
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
