class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.67"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "623357dddb929198c935c30507b2a3559148addab4f89210aa737ea854a29482"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d79fd146d30f11ad5b1032afc6571beacac766bf938ec5f2c526773da19f677b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.67/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ad26d0aa03839541914264b72d8ff319fa96dba407190053084946fac77d632a"
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
