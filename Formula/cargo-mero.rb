class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.80"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "7170cbd3abeae275bc33bbcee6e673b48cdb3697d71cf200cf1955370dd0a64f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "51059a503e578d3234e82d86bfc1deb03f0db1f2de2b0712b61d4abfcdf7342c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f361eb5a836448e892576d0a1bbc655914490de17a1c9a2620bc1c86ee5c678"
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
