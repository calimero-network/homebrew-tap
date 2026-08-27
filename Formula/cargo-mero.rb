class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "c2a40eca05c9b924e117c6c0288852f6fd770222a4ba0ebc50d389809194c409"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f0f4ab0dc28ca09e90929bd400b24d35cf650375bf1af28eff605a458f3776d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11de74beb00c9f5cf22b31c27ef82a03e0c42a1941ffd68df519435d9c8cd894"
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
