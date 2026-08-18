class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "43a24b07ee33c219eef831e00cdc12d2b48ab70476d1c13ee8bb0fe15c921ffb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64785c76ac91499be6fcf0bc3cfe7d95cfe8f2c9462d58962c6a9d73f1d4f5da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "da1645cd5dd6255cbe80b41dd3bfdd85c9e2537fbdde08ba9f6b8425187c7f23"
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
