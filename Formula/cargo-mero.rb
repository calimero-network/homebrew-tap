class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.64"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6a2486ae60cb5904b01efbe9cdadfaf4e1d9257e8d8f5d00f808d7201ba0dfc7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a21e8a780c73acba3f6a254336aeecbd79ed1e2bb9c3489c6e1b9b1e4106ab9f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4f28ad81ef1646d929c1a8927a796dd9edf30a88595ab9cf582cc71eb5a8ba8"
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
