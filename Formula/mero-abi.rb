class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "6e6c5d398e21de5fd632baeb169681333ead891a87cec22842247c00c15146de"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53018b9c271148a8be2e27f462690b09d38a9294ffcb6dd17c5c930d90cad53a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e93f149c9c0d7783d934177c90daaaac6eb0e5c7ece747c40844fbbe249bae0f"
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
