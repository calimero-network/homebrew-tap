class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "74d467c91fbe29618514c615233faad0657ee0c80accefc7c288af77f0c4ecaa"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f3e0b3adcf05a955b63d427d51ff25052614e733bc059ad8145da2f8a54f98d4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "63b96c3a12e9f7f0eeaa4ab63983a2804d75cfb3c0948a67f600bbc6a494300e"
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
