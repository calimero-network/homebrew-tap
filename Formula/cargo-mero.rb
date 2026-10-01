class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.70"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "2c0091da3339d5291665d9b24d03417a1628541c4dabdcc0e03fef8952e89bc4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41a9d868486f2c1ae7cbcbdbcc24a95ddd607cf77f4c900a5e629d1c17737954"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f10c679d43b87a1f5df07d4a2ab588535eb2ec46fb8d0edb3db54afddce9c2c5"
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
