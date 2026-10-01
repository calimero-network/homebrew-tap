class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.72"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "5e9ad2398154026f01a10a4fb5e78456faa27e3421a1532891df299e70a9b20f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "71b7805929e0e4461b54c9c90fd4e6d6d7eb7c9e42da33618124b9a8bba1a677"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c0a05721abe6aaff9cd36013dfdf6692c3438af582f81d8a7a83ff041fc353c"
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
