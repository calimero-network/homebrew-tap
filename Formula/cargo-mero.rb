class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "5689b6e2ed78ece008b0cd4157e43eb447b17ed24815e0c5426a21ce820c4e60"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e1588bf871a0dd9f431708ae434e65ece51849860f40be9397825e5d12598d8e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e92abd33aac4df02db8706a7d56f091fd5be27939826c2d8e036f05fe94d2b6b"
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
