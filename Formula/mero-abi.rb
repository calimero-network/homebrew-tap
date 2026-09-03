class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "83ea886c9e02c1e420ff01b7db528f133b1bb10840d4c45e97eb24ff0e7f6f5a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d4d095f5e5d95e569dba7701661d8f2913ec4ba61cbdfd7043ab64828c96e805"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.32/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c97506e22f0db343ceeea1b252e91084338c119ea8d22b87e3c1c0bac3c6002"
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
