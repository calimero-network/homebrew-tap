class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.51"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1118d164b2239473da36d87694486d154740470cae77fdb230540ea14c40cc64"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1bd6a4a2f3ea24e3022f035cded3112fcbad665d5581f658fd172729600d9a3d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "85b823f2e5f7a326253b088c7a5cb5d82202a9e188129faef9eddf7df1d03f55"
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
