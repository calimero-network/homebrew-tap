class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c6b4e0262891b84ea4a10f6ef75d1e7f782f5ecd7c3c271416898b2bb41ba771"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dfe4019b3bd2376baf7ab21c790595d58a16462657afdf91eb6accb523f15e79"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c42c785f7826a907f1985aa0da9d69eb9201849cd437654ded1bffc5c4499009"
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
