class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f16ebf5644e9ebf1ab2bdc366170d3eda64cf105070f0ffbc7b6100743acaf70"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c886d9fe85263f52c482d09a88e91aeb0633fa6e51665e4aa7a9a1ca2fd37ce"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.7/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8eaaff7f3a9cbe89ea1a796dd946937d1df234ca8dee6987a97021e21941cdc2"
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
