class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "bf474736a68766cdc950ee51c79c3a83cdc36114554f4778dc5a789a43ea7c1d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "63bb1f4e812f587c2d8b13f966052d9b13afeab6c24518d5db64b2b8b5bc0196"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f835ae25d4adc123c8b87ea02274a470080dadbaf65f6ee40dd212ac02dd4b39"
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
