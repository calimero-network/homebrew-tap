class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "7d02f84d491aec0f570764cb207eaf7491e37e2fc5e7a8c1d05842887e960876"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7df1b31edfd2df229b8f5a15b4e9b006bb065283d8edfd78b64d7c5537c63e75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f3f5ed868d8f8d1ed866a96a3b43db10bcc8877babcc79b4604730a4413b6a4"
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
