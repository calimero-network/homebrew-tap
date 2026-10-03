class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.79"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "f28ee97a5e31fbcf1573a40746995ec54db263b76da0393356df64e178b3a305"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ae1908d12970615bfcd35de4b1fcf850dec563d3f6b59ffd6c151bcf7e1714b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b590e32e7c9570b07201f2b6acb4bfaf266dc5859c5f031e8f3a59ad36e87e80"
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
