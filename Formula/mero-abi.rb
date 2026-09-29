class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.64"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1d336d81fbed77feb684ec25a5a8753985970d9ff3a7ba13636229c156c570dc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "29036d4a85db80f03eedf5a4d6f3596953a25d7d10aece805d92eac5b5b169fc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70e6857147e6923db1248ffdb88e8068b12cc6270125e9f66506b22e0d92f83a"
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
