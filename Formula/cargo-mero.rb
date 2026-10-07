class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.83"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "8cfdcb364282f44f026f670a69475b0c6aa0ad2209d5695f7e00a1c1e4b8bd07"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4945b0477f203bbe41e4650d61cb17fc05845c0d80a8b0c2dcc4a2ee5eb4cf27"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ac752d7408f0f7cf9b0ea93dccb9191986f996c45e7410310ec37f100ce6eaa6"
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
