class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b00989520c14adea7d232dd7b2ff0db5c9b2ef565e2626288a9cd5e55047a0ae"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3b1349352279c18134bd3526abfcdf592834ff43ebbcae48fc66e2f58d47caa6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.25/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "37e8cbcadb3123bf1864809346a518514826caff11646570c2a53c0e34245c1a"
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
