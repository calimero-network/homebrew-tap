class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.88"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "c7f6604fe50eec82df3e451e127ed0548daeca8a30b364a8972a39370f8068ca"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "34cc6e74c52eee252f5a6e725b3e875e1be6eb197c04cdc955147c29cb2d1991"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "53873cb9b28428665c21b18963c52aa01f47af8afcb48bdd1e6a1efcc66a8f7a"
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
