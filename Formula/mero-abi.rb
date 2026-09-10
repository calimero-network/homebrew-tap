class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "888b10a3544a3ab7450fd6ebf7addf81da1a054231f350925cdd2bb9e9604050"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9da2d4bd418d10cb1159f013b88122ac9284a9bcf55711b182d50d5a3b6ec60b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a946b63ec3daa15cc1144b363d15fffae26793f4578e4ab942e651b43a862d03"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "MeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
