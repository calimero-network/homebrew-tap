class CargoMero < Formula
  desc "Calimero application toolchain: scaffold, build, test, and bundle WASM apps"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.57"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "76b40dd307ada76291219d536ea62c509f6d4303139159f4762d18c173f5a292"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "52fc139e4f171c480e15fb4f3480bb46014b1d9bade85a46a08a3d3983969575"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3691526ba7d75e75db08dbe714e1a7c75c7376de409a019fc2ba4039a426da53"
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
