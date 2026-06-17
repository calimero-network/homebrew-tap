class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "07b1c6e9b439815f91482a7c5930861c059df308220096f3881363b916ba26d2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b07245e035f1e3325057c7d3c316ad997271c0b1088ee0594d99ab82a1246ce6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0523298e412b27cb9c56e39be7af05b34b21b2d82cc33c49a6c5a5c336c3482"
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
