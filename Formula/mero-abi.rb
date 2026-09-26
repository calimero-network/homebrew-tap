class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d3ce3582577e56ca6abf3eeadf5124916cf3c5d5f9e5504576a25c6f29145b3d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c33547a55a839ab766ac556f0c5cb998af60fd65ef0e9682403ac3feff8e8ed"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d99ff12d26a18b8968ad582bd27206e30d1a72233284cf2e20c8c28e8c8521b"
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
