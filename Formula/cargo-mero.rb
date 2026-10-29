class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "42d5fcce843da0339ec9b5c29c034141e5df2fd70481777ab06375ca325a68f3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "94fdbec899470a9e24740a7dcd9498956b798e4ca9193b7b1a642b89dca13405"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c26a787e7a77cc97645284f23a2b0deead74b2974afe414305f597ff5002a5f"
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
