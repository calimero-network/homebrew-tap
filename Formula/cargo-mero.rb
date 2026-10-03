class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.78"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "4f7690ad66b7cc2fffda50f3c5bc6d8bd5de6654d29c1640af30459c7172570a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f86f67838824074b27c0ea282cfa15d4df37ae7f99b0f7013ed795cf4de64f5e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.78/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6758fd1b3fc4f41e5ff4e5e69f897c32b62f7991723245615c92450fcdc77895"
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
