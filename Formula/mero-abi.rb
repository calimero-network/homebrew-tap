class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "96529e6d57079f42514d3ee1a97cfaa93bdc68edf165bc36adb7c940800d717e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d9eea94b3cdc83e19d13ecdd1cc52f5b07e3d3e2d9798c06176314a0cb090a92"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03ddc25b14837d8280fc91c1a0b6ecfe4fa847ed5bdcec3adece21b2014241f4"
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
