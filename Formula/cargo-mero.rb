class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.69"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "15476d2a59df4e4b07a706183911da5c255ae7a56ae85f7094cf72ef5815547e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5a72bdfe212de58df07a020391edf92074f76c1426adfd6d1894347979e7046c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "37707e99c6938cd80157d2204890883fe07cc343d03ddf062e05e5b25ede5249"
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
