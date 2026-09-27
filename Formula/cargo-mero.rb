class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "890e259725cdf3ed08dab0d53aad49c1507062c8a6bcced090275a117f76fb55"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bed25df8b140f0fb603995421db888fc0367da21fe69626779f0772ee384527c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f3cc5f378268a9b6fa20888fe21f843f4f78ff01ebc2935521fff10f96411ded"
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
