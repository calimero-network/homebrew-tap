class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "65af62cbcd86bb967428762ad705e14c4246029acb51c9f8e4cfbd2bdf3028d9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "559efcb8f9063e37b0d2dae518173323913af59bad0d9fcec16302de23981ded"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2412ff5c7ef6a5fc9a83224ff078bc07d599cff01fa503dc9a23287e8c811448"
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
