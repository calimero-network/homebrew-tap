class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/merod_aarch64-apple-darwin.tar.gz"
    sha256 "bcf0a9b3b3d6594dcd7526216e53086a357e25855a7571755b1f121f0f282c2b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "864fc51791835243936b7554fb851eaede7f42d1c1acd825dcffe06200b2b4f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "936877b148d703c16e7ea3e4d63cdf43acdef3d165d9c328e15ddbd36789cfac"
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
