class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "9c28ec40692669cbf2249c07afa824ab3296c720fb26670c90de2ca515261d86"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "68e5746d499fdd75b428f78628a27053158fdcf1ea7149f48f51a68c8c8eac8d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "86e32bd1a7fd976dafaa8269dfdfe4e8d89b35f0a62f3a6f6d3c4a6387ec9331"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "CargoMero CLI", shell_output("#{bin}/cargo-mero --help")
  end
end
