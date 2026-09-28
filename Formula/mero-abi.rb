class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.60"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "84cce0a8f118e4677bb4e80ddb8774ed5b23a459c26a95281e323a0c4bca3749"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3795f5f1ae2af46b214a84fa4f349d68a2cc5087749a10075a73eb1903e17495"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bfcd0e9b43e802e3d861e78f59143313289455f3c01c59d60bb4ca57f674e4dc"
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
