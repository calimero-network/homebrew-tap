class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.89"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "e59e91ce4706052e42f8ae20c62d82499e3054b028f2b02f1de7dea837575497"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0ec0aca19b11075317d0c20465e893a1039ec0a2a71644ed9147dfd78a967c96"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "38e5d81b684b43a71225b396ee32945f48d40da31d64cce09069d39e38918826"
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
