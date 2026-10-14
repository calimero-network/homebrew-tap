class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.87"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "f749cdd72d663ff7118d885cad4768c762ef9105fe5e1a9875c9a62278b13052"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "74035138531c904a6d2209f9bb3a3ccd05e68263c1c58642c3c2ed113340b9fd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d77fa1335398158fe477f5dc8c6eab2d7fc44ea3b5319269f81b19bb8fce1ea3"
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
