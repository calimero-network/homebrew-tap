class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.59"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "4ce757d4083a524145cdad466a0a8dc0b4dee0fe02188f464f1ebbcffe69d931"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cf52c7d6da06d88ff734a9686387da830209a7edb3deefb1c6a34e2f329be049"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5f8554a0ef558943797a8fd56400e431208755fd6ea3f9a4d909dea3617cfd14"
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
