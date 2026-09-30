class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.67"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1b835481c0e46a0c83966429b59bd33b8f063b6f9b87265e4aa09ea8bcbcfbf9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2643c6d2cae820084d5f233bf9edea932efb32174c8e5310977f7a58e395a68f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c686841e3f3e39e835518e8e4bd0e6ba49d67e10c619512327a2fa548d6be2ce"
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
