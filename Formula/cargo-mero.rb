class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.60"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "85c69230c8bc20ea59378c9b24a59f84e049a1f7ab7265d43230e36e1d21aaa7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5982b5f6ffdd497eea6ebbd833a6d496c04e14a42f3ee8ce575be66068fad32b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45b34c81684ece83ae1b2f249eade4f43a3434b1d16562195d87e5e5299d0311"
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
