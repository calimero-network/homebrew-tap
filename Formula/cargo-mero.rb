class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "9e85804963c11cb43dd0904bf3dfe178f99df933ce888412796130f944f2dc96"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e21a7014bbda405c0dc75988de76948b779bb126c0779446414e7507277018ae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0e894b30e6b754c265c59339680cb2f7d8da9cb430bbd3cf51948f5ee1f1f20b"
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
