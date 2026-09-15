class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6f4cb3c3d8fb9ace4da18cccfd413a13e91ff79d2813b5bd8f51df3b25698815"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0493b99f454aaf52d931fa9bde11dc1c8009610d44eaf1ad3a72a8807cf138a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.35/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "25a2e8c378d685f4ddc66745e91623da83756801aa047d2e47a6b00cebdc39bc"
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
