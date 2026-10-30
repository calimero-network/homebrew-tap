class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "5cf33bfee1d258087f8ac04580d061f80c9e4835adf5b63c3cac866f76f9489f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "059633783b6f56e49a67895e9f05c997aa3a9555699652d0a4a6810b01fc0bb9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "92e31f8d6fe1ea71817fda6d1d5401a24cf109528c23fff1800639571970edda"
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
