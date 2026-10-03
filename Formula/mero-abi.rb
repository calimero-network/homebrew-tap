class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.78"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b12bcd213beecfb333dc0802bb083036892b9e9c4538ca82a77f3db812185b70"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f568e7ab97a0dec20e75724f26267f2a720d0d670701443b5192936b323e3c17"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2b3bb39ba70bf26509075a28a367919aff150bcc15e6d84c1b79299c9d5d069"
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
