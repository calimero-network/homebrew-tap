class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.58"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ba1c8683239e32c9851025fb2de8969e66ffddee3e40db56cc2c6d927c0c5c17"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c37b78c5acc0fce08cbd2d3cfda7f11fc3836381390b8e4dc547fbf0b22e719"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44e3035c1d6bf2ff31aab332f834f29690d110edfcb4c20dd49140be58058044"
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
