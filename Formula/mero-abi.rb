class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "84992dfa51818233f933d8022a0d0499182a0d99aa09d5adc45c9dda3a33b326"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8f5250028d13694522c825451ae637833e03f3772c73ea27796ff9e2c84f588b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff8890730cdaf53bd6af847a73b0f3c83a7601e20492c55a378c2fb2bfd7d3c8"
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
