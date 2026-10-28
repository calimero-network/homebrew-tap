class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6bef805b1df5f98c91e9452ac06e57ae72a9b2aba3a74006c1f33188772a1e46"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df859a7107abc7fc8faf385aff2b7c49a949119acc977c46b4a2173b15e03fcb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02f426648b4679605f0d179860ada7ad54f876798d9cf12be90baf441c66e3c4"
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
