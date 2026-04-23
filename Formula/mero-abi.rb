class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d3a04e4c3c0d8db2cb1591e24fc02771f72bf6d24968d24ab4060c45793ecc49"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c562034e79b334f27d8b62246aa59e88297211f0b1811c7da1c37fa05c9cd49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ee1afe438a164485eebd3bcdde6b6ee626429dd4f1e3612ea99abac971e68c6e"
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
