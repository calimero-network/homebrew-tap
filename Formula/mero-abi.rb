class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a4f2d2fcb2cf0e75d37283947d9285563fbf9ca819e24ba84503ab683f01b08d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3df7665aeef36d574456a8e39bade5e070c9195b5a3328de9ebcb9ee85968327"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.17/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c0afad9271ec75f2467dc2b82b2431b23b7629681e749dac82b52109580d52a"
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
