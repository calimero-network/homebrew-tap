class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "a2f50489691a0c3e7700bc835b737b4883412bf0d2a3442fa7efe3fc8acfd582"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb38596adf0a56d1ee62437b3b02b4a79174507e92d3caccfc64f14d574f65c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af9a3b02a7d9e6324a3fe726f3b51aa3abebe2131b6c87c3233ee08eefed23bd"
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
