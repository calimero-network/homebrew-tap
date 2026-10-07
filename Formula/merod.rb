class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.83"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a60cf4b32d4aa9baa20411e499d3a8433774cd86156c0184aa525defc49c99b9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "39c22fdc2fb4561e697dbacfc4f73ba2b85eeb5bcecaa9a44616fd480505bbed"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "393d02fd6e9257e1ca37b5157d27a3b645aa396cfdb96d40dbd876be15e0c1b1"
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
