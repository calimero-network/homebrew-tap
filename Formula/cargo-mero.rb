class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "8245979e06dcd0604f5f95bdf5c8a439215f95191af18ff1a17eb0f71200e3cc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b3146e26aaed3fd180a64799a52a1c0cbe0ae15321835b5567be5d8d166f91ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6c6e0d4f94bdc9243fdff82a50c30348560a832f6f99055a491d97671fbeec92"
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
