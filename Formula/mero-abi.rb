class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.69"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c60e5c525d1913e3c91f38f8feab67ce20ac8f7c19482c95dd38f469b52773e1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b263e14ba195623296c031c64d83b0767100816fb95c0a110b3052777c005732"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e963d6f54bdec71b13541fd0e7e13178b600e9451f066b4d20c90b09bc683d65"
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
