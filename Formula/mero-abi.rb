class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "003c63d1c8cb98565c8c715f0fa79786666d47a86878626a2658f4eb17b9340b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "724479a17245684a3580feb73f9535d05a8627ddb3e4b7029659f72ada6f3a77"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5cb55012144a39c1b87366e6cf6d8405f728719e73079da1beefb984cfb537fc"
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
