class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "d9bfbebd85f56806e8d1a6c65651b9f8ce4d2d971ed4d5c89c4f2284f2f01321"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "21e15d152d73c0f65aac7cc969c8428a4dcfd4bfcb68dcba1126f032fa45e6a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "12845576e53ce2b5ec480e641343e45a54f8bed820ddec4eaa5dfaa3e2d7f350"
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
