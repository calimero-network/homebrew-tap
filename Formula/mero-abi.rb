class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.73"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "70744d1530f5f0cf61f8a9f208d43bacb030d46a2b1a382c412252db12d08efe"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "02a1cd11cc3499f1c9d775242aae262f1b661b95130d7b099485c3cc4a0571e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6b195bc0db133e5e759685fcbe588df2c3ee4cbc0615d9f1a363fa22c2c91e0c"
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
