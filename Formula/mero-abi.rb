class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ef4591edf6c7e191e6ff4b04992aada2264bd7644860864759c90230fc87add6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "9cb1ee38d1c0d00812c31de9bb8910ffd0bab06e3b364d942dabdf6461cc713c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "18cf612c5b00ac162f4ba0b44c281abd61c290d4c873f78be2b656950bd4e336"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d58b3b7f91761fbe3cc3d33037c17f88601f715a7d5f273170f73e4bce458d7"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "MeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
