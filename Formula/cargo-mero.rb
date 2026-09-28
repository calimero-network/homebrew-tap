class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.56"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "925d2bdc5b5ec57861a4f659728a9d81ce8fc09083c52b111097c9173fe1aaab"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3df62962b2ac8920df9bcd94d4736cee2d9782afcea47deb79ad9f175cf20dda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1b62abc89a3ae5baf7677f3967d7e95c26cbe9ae798243d1db042f5e900cb508"
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
