class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.81"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "7df204d7a4cea521f5809951ea3a230fd68a83b11e82c04c275de4693991e303"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.81"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fbf23c31727af1eb1912c6969a357830f64371dd73c7f48a226143c93fd712c9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84a648e75d294f7bc7bd93f99ed53d63025393f08e7309d3b48c44adfcfbf1b4"
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
