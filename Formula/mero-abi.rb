class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "27247f3d76b726fffb22a8e1e0cb435217bfcff50211a76d72c72dd9ff86d0af"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f8cb5b5aeb634f7387fb085915af4b59c08d4d234d8db9c89f7fb728988c18c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "07b07520f02ac4ec78614c1a25b329afe290e527b39664f91786543d46cf1902"
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
