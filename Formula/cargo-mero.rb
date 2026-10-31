class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "25efe919c34df997b44ab8d74183b2f9d6e4d671ee5979020a5f8fa157fd5854"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "29158dbc555ba122d57aa8cc3d5a36187d8ad39867361e73ae0da3cfaaceba68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "634c3fd86c37d00ff6e0575f08261908a903d746de755c191c6e34dfc365303f"
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
