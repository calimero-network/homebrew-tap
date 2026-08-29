class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "ddd6595f197f94d3c0d2fb9cca53f55bbd167b604f7390a08d68622d7dfa2722"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0a17fb60b30b937b8ae11ef24d7820eb4daefa3082238fe0b799547b67e82f4a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7d3b520943e31e9b565a010b9ae9004fc832c3a3d043422c84349306990910c"
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
