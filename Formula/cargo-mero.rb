class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.66"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "3c4aa784a6749eeb6217e677e247ce7c16c522f138651527ec4586f67c357ac4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5e2220d05d89495456272303af263d219ca43ff1c99833029db0ed73d6f05556"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "831a6ca3fa696ec42cf92d4d393274b627e463879a4eef090937011f67e5aa73"
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
