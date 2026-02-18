class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/merod_aarch64-apple-darwin.tar.gz"
    sha256 "e3244cb9471d243de6e760fc01ddf8bf40cee23f77ff2429bf87d7bcf4b30995"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "640e106379a02ad1b53e5e052841cb8b8d10524bce6511a8fdb36942f73b0ab5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c126937fefe6415e3ab24dc26d2aab93157832821fcb33f16394ccdb7977711d"
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
