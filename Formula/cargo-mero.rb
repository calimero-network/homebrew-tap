class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "51043d2fb05ab6a122311718b4e8a4e9c2f5975d61d8a60fd0e5e970b5d0bac9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "93cf3d7314b287bf4e2e907eaacbd875f782ecc71c62f343241be042f541ab86"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b7ea203c3f9c6a80bd9d4eff3be6c0f02a49a6e484aa04c25466afed874418e9"
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
