class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "72279ff5eb24cc6469b05d2ce7a2faaf9cf926bbb9081f602e2d594fb02f2e0a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "48c0eb92a16217b72551d29933752dcefa6b3a6da647e1df6d5ad0f831aa6e8b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d42ce7068aa5e10081ba304047279cf663e9b747c631422844a3aa5df6e93394"
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
