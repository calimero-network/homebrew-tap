class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "0654067acf2d1ecca15125210c3cb3b0906d8700850bc0092929515c5e9ebd73"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8109cad947e75eba299593ef0e1b30c44dca8951771d9c591a6289e1fb3bc91f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dd5dbe6e034fbd26392ef62cefacdafc84cedb552475a9f8d5e276024e7928f4"
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
