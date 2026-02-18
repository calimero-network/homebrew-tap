class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "6dc5dd870c4f665bd095687325616fdb54f37e294e5be6b9f5c16c6179fa5a6b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e54080793593a8b0b6421dabc2661a67668dc0e3029d850404a12f51f09c3824"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84877d0e21d09d4ae2db0fa9a2d1d8d183c4127bcea4e33841cedeb3ae302dbe"
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
