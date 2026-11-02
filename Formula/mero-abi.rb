class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ad54e75490f479c05d23b2ad924f055135a59155ea2ccf2f75143008e9d46958"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8a2caa41416dc49242966b0ebe2612257b938e36c329d490ed7e58784f482b3d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8946dc7639565e8f05caf91aa11bfe9183e60944d407b40b1791edd5de51d5ee"
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
