class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "aa5e8a5b87b738d9342885880755a40e694e87c9d12e29e3c48c38b4f454dc76"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60fd1ed5144613bf42680b35b292f48212c5161626e6799559f90d72c6067441"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9b40a0ad4eebec0adbb7fd9617a68c190bf88de1f23f1e9eb56b39fd5ec3d0f7"
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
