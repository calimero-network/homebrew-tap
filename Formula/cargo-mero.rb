class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "68b454ab0ffe924b505aa47f4f5bc95b7bee93b312843a190d4489259dadd688"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ca8265e402df127ea1eaaff5a3a4c6ee70e2bdb7a66d3b1e1180ff4b112611cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "14b81f2775f699cda28de2ffff8324eab5498a91ab8b5f66fa1bca7261d28210"
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
