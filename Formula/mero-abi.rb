class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a62bfbb732ee18c5d1347228f0ede9575df47aa31318d54d587aa18e67eca757"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3dee0626da2b9c1db2645986d41c6f3c8cee8ee3389fbeca5eaf33de2c11caa1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca56fea505e00147a7166ce7aadc45c8981570b7bab45db64c63110ed6416231"
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
