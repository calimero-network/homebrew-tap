class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.62"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "673172393e51321b687e04ecd1d40121bfd3f568c6ee4f24c7424d5e36377127"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dfc5f31e617f0d6589122bba36d2e78062f2e53f0a9be34dd48ecc996f412df7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e725ec6e305e516b9898ae1883c1a589790c0d8403f8faf7f6b935c080b44c52"
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
