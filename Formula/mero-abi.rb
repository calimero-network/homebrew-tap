class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "4e42761553c4e84179511bd582e6568f7ed6abf9322e63a5a30dc68a446d1f5f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "26cd618385b579daa6d3c75198bf393d51359f2b8da219479a729dd6fd18b037"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a5306ccda6de96aa333e70b3574f3b1a53809542eb21b32d1266303a16c84d08"
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
