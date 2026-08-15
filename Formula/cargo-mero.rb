class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "d9e06b31e32fe85be0221d316f80135ee84d7b3759d25734c3406f174f1f5c6b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fb33c9d2515cd5863a8aa04cb9050f2df99e7b97ea8c46862b804830874e2087"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "463c5d0c0a5e13d4dd16729fd11d4729055e7f59976ba2861b896d6d67b18d77"
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
