class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "45be90b6260367dee4a15c1a0ef410167104e6bb02cef15b683f9c98b624aa22"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c37e084568d56a56e032cff7a4db2e7800230261a0dd581a9f7f1ee56195df7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8b1ff372419f3b9b3cd9105c8227ddbd2d2f6d356a8e7f558186517bfd68e644"
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
