class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "f194fdf837b90c74c03f7c2dfac0ef853bcfc06f4d39ea9308ded570cfd993a2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e584a75271e919ec704027a19cc21c3336878a1523142f8750718bcef4c09fdd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f7c7fe90d0f4d760027dd189db7dd56c0509d62fdf461c7810f5d04ef2e3c453"
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
