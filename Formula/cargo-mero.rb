class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "961e8804b19617e2cfb03ed521f1a18b104f63fe7d8f6c07ccc5d63178bc362d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b022c6e1949b4210ac1d632f0a8fed51fc72325828a6b40762685316595484e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c519a3eaa1c8f0347de8fb11fd384fd6f081fec9c3f7771009918bf87e06ee2"
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
