class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "096f49b3aa4f6bbf56e55972a25dec711c5b726009730f4b34c51afa1f1ecbb3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ff37e6266aeda16d7bc5748bf6d0f7b5aebf4fcdea31e1b1c9acad013b987e95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b2b758deb7eaf30ccd956292be8f476277c733335c8a9c9738256ab219d5daca"
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
