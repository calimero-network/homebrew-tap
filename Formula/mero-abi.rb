class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9235d278d99d0ceeed0957dff9731202518fa4ac812c44afff85134572db3542"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "431b3541491078272a4feea77079f0eed7e7518482a63e092e4e5e56ed77bd00"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b56e36d4faa245903ec4b88a2c8c73b171c86684c4f3dd26411db15cd94c789"
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
