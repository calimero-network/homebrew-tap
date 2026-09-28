class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.55"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "64c9330e9ec1e891d2a49d1cc06bf7f1f55e54b75ede89277458e6fddb347299"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.55"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fe778c1d52dd02e56c5e588632af277b65d614d48c593620f2c34c79cf1f19fa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.55/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7465486fc6ed2b643e272daec0548b15186ea7617b7e77d8d2a747e0659fe76"
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
