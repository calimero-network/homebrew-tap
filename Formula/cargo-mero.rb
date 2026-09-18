class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "2a72c4db2b55c8bcd2a54ca968cd416c53dca44009fb7abbdfb7dc374d5d77c3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2e90455f745ebe0b21850e367eb235b3411d5674a327ebc7d582e48be76647de"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f260f1ddfdf3547a766f83d25e017d9b965cf1312b664dccce006fb035fbdf3a"
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
