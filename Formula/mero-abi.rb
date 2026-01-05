class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ff9bb56ff2b952bd4b9ccae0e0be0cbd1756a00fec72b331f3cb69159658931a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c4a022d2398fdbbbfa841490add69d195bcadb5a5a0aa50820a76c7beb3552bb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e39554edfbc3148c45d8dcdb89e591d7bda0e1b92edea862664f96be21dc1dec"
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
