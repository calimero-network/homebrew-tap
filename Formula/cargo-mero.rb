class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "16b2c0fd5bea5bd849158530b526513d705a854fbe7764604ac69886981bd019"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b6adff8d5404fac8b9058e29182a74804ce1c4841e304cacbcf07790bd91651"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "143adcbaf22c3d46fc8d3896c23506ffd562c7c49ca55fcacbd1dc7ae18274a8"
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
