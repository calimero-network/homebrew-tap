class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "7d76fa438be61b7f2ac4933e8f76122be359277b98502cde7dfddf871cfa8f48"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bd9b84f914a6159e75c07250a584b8eaf8f8bcf2732b494eb35459fe84b88d3c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9cbf3d649165b300b85fb65065ac28f8071dcf2622aafc2cb92e6493ab854e69"
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
