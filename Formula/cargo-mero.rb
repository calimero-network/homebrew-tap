class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.76"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "1e126f893f191dd7ead8ebb6c70800ddcec5b1b39f80cb068e5c4bf53ac3c147"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "70c7529381d938890057d9f973c8b80eba5ec66d33714b01c3b311ddb3d03f5f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb08cbac61e15efed3aeaa25d590adcece6fef63af775b17f21b9d9a6a8cab36"
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
