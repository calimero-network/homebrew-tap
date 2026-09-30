class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.67"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6e571431cc9a42650d4b2eeee773eebb9c6ee5c10c712b7c221037fb6e58dc62"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e6f3624e3887f99a8c45e1a5c3fa64407d2ff0683e6678a21d9c40eea3375a4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e927f56d56384076c9862d02ce43ec26507d4437b4259d6e724088cfe6ffa630"
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
