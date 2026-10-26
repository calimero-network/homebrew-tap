class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "10c7ed4207b2f756f7630d6267f2ec446832f7f466e3f7ba6bc3181180f84391"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b103cfabf3cbc2a41ea040fd56ac717449f67eec638623da5b3c9c6c64bc26f0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ef9b43a03fd657e5b8743f335de2f053c478ec5ff93ab8ed4d482e8b1e53dc2b"
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
