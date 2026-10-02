class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.77"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "31911f376fbb62a1b9cc27e9f29befe0de98de33e3f66314fc04120c3056f64c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fc3b29fc5222cceb6b10595af67c1ccbc73a65b13801309d420398fc5fb3a419"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d285a86af6a0765fc5e110ecc1124f39369a6369f1e53e149cbd4b88f845ee98"
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
