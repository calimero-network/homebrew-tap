class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.68"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "683823bbeff6f15ad423a579d9a6715ebd84e428941edc2113758a55f81c119d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f77248a786230dcd75f406077ce0448de652c49e7477377d109af55bb0eb952c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "829c5899cf6af8ed5f77cd8b25a2e3dd1c835318e661780c56e424b16e78e60f"
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
