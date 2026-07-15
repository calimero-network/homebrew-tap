class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2cb660fda4eeb21239e9f989f1d82d097bc30c7176cdd6c240c36ff7321d7c3e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3884f731115f271c4044b29d9f2a8dec5409ee9c3b17c8212150f5e3d6954633"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "46007eed4dddf89eaa3e3429ce9d9b0e66cdb5e0733ea662548d0d12c02d1f55"
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
