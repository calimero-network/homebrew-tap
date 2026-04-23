class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8da2cb426f2bdddbd7ce402e3c38380480490c97c47add06986d35da91e68bc7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2358f711eb5d4a7eaa7f0d0798926ed83f88a4117b501752894f943b56a022f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "43c0ab85cfae26f119641cc1710f9f6b52ab3bd0e200ae7548b545243ef0a0a9"
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
