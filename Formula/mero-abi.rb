class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.53"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b1cba351e244039d1c5f4095245dfb2907bc133c908b171fa69b34df1810e5ad"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "40cef07f92b44d93f568f0f0af5f111c68b4d213b540f9323f4dab09c5b02de6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7e14c4e70f5daf252eced7c79b96e0aeec63c3918e915eac776584674b64314c"
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
