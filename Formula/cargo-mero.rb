class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "4dd2a21a04ae1cc5f9c8a03ad8f5e282d40b65c523b968ffcc89a7fe03434977"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9fc3bd23baa73575687261297f3bdb2756a17477ee28c1e3993ab6b442926710"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f732e49d0ddc94d8b8eccdc4c5b93ded614e8be1631ba232f06f08dc9f4630ca"
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
