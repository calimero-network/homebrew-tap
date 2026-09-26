class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "84826d22603a21f745227f33a96046d253b45f8b64de7acfc32f9fe0c8455ac7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9b5e340c1f1ce2de226cd978f2ffabafed369eb067b3ad371a7494157dcef47f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0144ba63a83752bfd1b1021f8093fd235857b8e03d36e467f97b7bc33d5c612c"
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
