class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.90"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "a7bbc2e0d717804b1d68fe5072e3f35bada4607cb233efd5b01addf9b56407dd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "925afc736d3898375979f46b72d139d6d4de4ba9f4bd76a5afed2a0c0cc67b15"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "18549f33b8285602f4ff8d950ea2f9c9e21e5e57dea20873da0019a437d2f4aa"
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
