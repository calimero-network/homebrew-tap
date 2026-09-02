class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "299f59e001c3339d70a631f399ca4512d4dd9d8f8012e486f0764f513efa9021"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e5af53374198360ca0daa3c3233c0816828680afd8054166e622d396703bea63"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff9f836d95781bd7a24336c18a27d27506aada6d8623d7f9d57f1341eb0c0dff"
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
