class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.75"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "89c214529c387e40863e5036a2d2604e8b95ae654e017a8b2ac49e423f938023"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "aaffb38e7d45c6cbdd76583d262f8a00e780c8aa1472e453dee9768a71dffdba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0b16527cd68f15dc08278ddaf73dbfab03eb4f7954b0d0323798112c6dd70adc"
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
