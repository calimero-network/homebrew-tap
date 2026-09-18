class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "b46184ed70b4ebf06d486e35b3240123dc7bef75b4f584546d09a66536621e02"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5b95dda7422948d4aac185f39c3a773a8585cc4d9b2635b10762724f013cfea3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a93ac0ab1b480fc7a7454e0d0a7d5d1c7395e419cc05b97cf790b3c065f487f1"
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
