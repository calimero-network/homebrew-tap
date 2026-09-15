class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "2a575518cab4714613ead1f13532d4ddd3bcea7bdba93f1d0d0fc2ab23f15fd1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c3b31d898149472b4ddcf5db69575ba9e314dbc6d81ba2ac6418e28a356c6d71"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f2352a827b5c56d7120ca05e19d4e51961028daa3b9deb4d02b3d50bc1c2572f"
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
