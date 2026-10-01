class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.74"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "6955ff5c4c176ee08fd11242cbea12990de7a3598a96ecdd3a868c8d9a9eb99e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9d0aafc1126c2a0b2d67eb7f4b92ba3cea2299b94aa7672f9a131ff2041a8433"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f07bc29e6c43dfe8dc90e47adace2686206b26ab6b86138f6fc82a812d495aeb"
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
