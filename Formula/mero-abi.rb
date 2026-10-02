class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.76"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "331b4b865b1bc6e40e93c51ac63d376bfe31e643d5d262291ce0be614b534445"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5af461a1596a32c11884f60b52542a72bb1b0be6d6516cc7802ce138564e1ad8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "599f9afbe5c8c82f7b7eac6582330b338ba44c1efdd190092d2f19ff0a5d19bb"
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
