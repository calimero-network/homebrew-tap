class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "16d4ef7958b015ef4d6413800d045fe22534906f0673b413fff0edfbb99bd5c7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "307d871a68a772bba44d80d40541c5b68a4cfb2fb00b951e54ca9e6105f3ab0e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ddac80f3f323060653f76b039b905f3623cc8345c721b399d122a5007993c5e7"
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
