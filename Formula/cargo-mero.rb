class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "f12cfbb1db55acff3c1d774c5a2959d62211089857e8cf686cf98e0f9d14f1dc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2984054cd35d18e0a238b3f50fd9f9f50174e3654588e10be097451545817ce1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "095be65ea31e967c5028a099a543305a3392b96c933cb9645c13dbc1f64538da"
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
