class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6d818c4f167d39afcb31cdb00def63db7f4d2fd8c0789ae0c05d4c1ae9cf1270"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bcb4ba6f03917c878ceab1776b2d4c124420c13916afd578f12650461913e05c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11005616f7ef1df6d5ee9f26c4998f8ebbee4919d0cb450ee0a62adf8e374c9b"
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
