class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.63"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "4e10324bfedcfbe5fe09f42f210495958a92a3b68182821a85d5b66b006f6e0d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b1fbcb01b00b6664a126f719dee67bdd12d37f98c943f7393a41f2e823d2a2a9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa5c895fe3d578c7ee8e05f3b22c6534a2e248243dfe69d010ff88371b7e5818"
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
