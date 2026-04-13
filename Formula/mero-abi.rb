class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "94e47a502f8671c5615b85058112a5876e82d7918aa88bc61bdab55be20c078b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a07a2952173bc92aaf00097c1f860b271f3059ecb9899592bb78fde17ce79402"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d6c6ee80e6774bdb3c696035d41610aba3f570bdbe0b5c2deb1c15fef610d3cd"
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
