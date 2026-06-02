class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1cd81226ea3455218eb516867e97ef791c402659d317f07288dcf9b0e6461352"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5d1e1d1b07a9d8338243e057478da218719e33ecb1a215d102a17aec877286d8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1694314c55729138874f9b48ceca3ccb7b1552874d07235130e59c6d6ad526c6"
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
