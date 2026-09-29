class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.62"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "9bd47d0af2bb114cc30551db966603ce5f2e9789ac29414a52aa49ab9bafabe8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "de0d9c38071380599a763f83e534b7da9d6ed93cbf5e0f9b960cea127e0e5a11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.62/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afe62457b26d5644301d40053332996b5986afccd331202a86a6b12096316918"
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
