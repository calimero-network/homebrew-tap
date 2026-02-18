class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "0bb2b3420b658ba327ceb57dfa0e43025e4bc02a68d5afeb928f90033b74192c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e0e7ef7352381fdd4be2798c66e6903a464caf98c5bb22a36769cc50471dc387"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e69c20c1500552fb21f9d4c0d3b80abe684a5b5d8c1b02dceca0b972764b2e9a"
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
