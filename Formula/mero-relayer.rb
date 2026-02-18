class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "29ae55e66cd2f9c26befda4a337b7a904d9b55e0b030e223b9dae131e27434d1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3246ff23d8c713ea85be8f26f62eded38675ab020efca1efd9d4a6887d350838"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c08a488b435dbb852516a9533fdb1e8d76c832db3a91e01c8472268e727bc430"
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
