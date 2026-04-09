class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "641c4e70408211549221096a342cc9a30f110c326d88bdb0faf6ff2e584f95fe"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8c440e9d95e46b168739e9c781fbf1db77315a3517f7eed7a4690dda1333caea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "539fba4de3382e19b9627aff7389ffeae69922abfcc963ac3202610b9b0d86a3"
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
