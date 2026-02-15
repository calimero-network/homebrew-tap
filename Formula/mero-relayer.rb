class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "75bc14fa118e224baa37fd6c70aa5d013502821d5120b160e24af5743d194760"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "11779fffb51735cd9b6256034bc15b14fcd184cfd315e844778491b20119d651"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb2d491e62d65f18e7919c86080025d6fed3f610baed28af390cebc97d9dcf0b"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
