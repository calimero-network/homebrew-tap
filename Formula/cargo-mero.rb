class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.84"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1309d36f4499061a11dc2cfd8bd03f42ccfccc8504d943040db7b45b1d124f89"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "188409807d5ffaa707aafbc0b8418c813c66cf613863b9ef1970e0e25b496d56"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5dd7a7d264a16cf9a0e1333bd0238db2b455f14199a6c655c298d6440a30621d"
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
