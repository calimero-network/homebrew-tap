class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.66"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ed559a3faebf3c4ac9b38a483461cbfe38ab1aeaa3edac68334318ef1c93c1f3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "947cbd7347c34f43777d7817f95c3852698320a09d29ebada0b73edce943b7f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "105f596193bbaa2d1441fe7db15dca809c0444a4de2bed4775455952dea56235"
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
