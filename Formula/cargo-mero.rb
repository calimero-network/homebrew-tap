class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.85"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "3e42ad07209ebc6a9eae67017086bfff33c643c46967a400ad7040d31ce566ef"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "03c6fd6dc2e1ffd18ba6fe933c1b9183ffc8faa42a1bda604c032db6369a3e93"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "abcd5f5e015347c97cff387dcee0997f8f6d97d423cb9fe0d760da011f9c1c96"
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
