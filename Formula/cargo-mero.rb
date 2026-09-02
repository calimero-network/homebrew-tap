class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "7e2b8a47dd2f2fe94cd0b7f848a0f064ee1a7466f089eb2422c27a8b5a2cffc7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a91e3783f9ff802148510744b8b7a85ec519d3527dc1cc6a39f4fece5ff59a1d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "17661b91ecd0effbdd7468ff7f595204173702f74081d261b5d1f9321201e24a"
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
