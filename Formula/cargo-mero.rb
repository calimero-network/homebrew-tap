class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "2e00ea61a7841a73fd44c0821bd08b5e76dce5a37d1d1ce397401976ea28163c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7377442c30bf435b39ce1a0c4e7efb9318ba046ae221dcd608d8326abc64b616"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "05fd485db7acc6ca84b73e6930cfb30d47aaedb52486f2c3e3fe023538d4f0e8"
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
