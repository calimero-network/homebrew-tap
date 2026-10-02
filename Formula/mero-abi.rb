class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.77"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "83dd6cd26a02da3e0ee4bbfa41f9dcb76cd2eebcc1a791c1329d1bcea4729b28"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "baaf78dce3481fb1b0a65d09e7d69149ba8b1091548e55334a69a47c064ae66b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "83ee2f34a1131ae0ce928a794ee90d9fcf00dc665edd98001f727deec9372406"
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
