class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c81e1d1fbc1d3b57e356feb89a5bae0feda06813d27170dfc5642d33cb4e19cc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f961cae2d812cfb08b8daa39e97e9cb8319b1e535f346d5b49ac90093a315cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00c78868be9cf444ade382e138d19f0896ecaa375fc12edcfd441452f6070e75"
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
