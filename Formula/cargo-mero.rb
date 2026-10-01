class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.71"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "707b4c437cafcac14f06185b33bba4f7d447af5b2533e32702df2eda564a538b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a3c15def3fe9d0b6236ef2b5c8762d177c7044cf0a80895ca262bddc874c25d5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "032533dbd891415261721b29b17b36298dd399c8ce77adeb0a1c5b10fcf8e607"
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
