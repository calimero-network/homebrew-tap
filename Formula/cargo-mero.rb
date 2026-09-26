class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1e8df65ce95439a5f895a97879039fd95b7a0f0bb76be0d6e45cd9fbb5e798d3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c93f1040ba8c59c45640b764edc47b368e02b1bf9e859a91450c794028e5a2b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "96664c17e016f51ec23926ba730f97def0d8505fc6740cc8ebd11a020b21c2af"
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
