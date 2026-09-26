class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "331e78e1b9b9cc48e0d14ac7c8eb766a42984c22f575a79f62668f3551385f80"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "623f531d037817ef32c6c11f4162f176a1f179a2d4901ca0c362e73686fcc650"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d59cba065c8e1cf11616d827d8efd9f6b5aa83735711222fe73eab1ae47538f"
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
