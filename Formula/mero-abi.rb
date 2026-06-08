class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "3e102f855da586d6d28cb29bfd6d98fb7d61682a7e0d9929d7006bc9c1e3fc33"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2f8062dfbcde96024b114e1945a144163975103d302abde4b49f29d418fe4448"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.2/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c7823a613331f27186aa7ee9749f0174710f3ecc87a10a11872d468ae308a03"
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
