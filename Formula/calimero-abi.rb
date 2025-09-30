class CalimeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "CalimeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
