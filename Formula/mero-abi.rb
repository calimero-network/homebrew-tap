class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.55"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "30c6e5c617cfcdcc2f0fc4fd7077bbfa0a47ae81eb0b486e71f56fd389ca475a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.55"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "367d5804480f54d7269788f5b2ba43b9103d219a5ca935bb05beb4352cfb65ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f73b4a985477643f3933ce70cfda96eb13bfe63484cac4776bef917274d4c696"
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
