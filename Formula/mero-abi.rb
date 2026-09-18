class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "061e9d1dcc7ecb66b4bafce84309095a449d6bb988e0d262ae19a74c1896f023"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d0a4d59af92b1aa9724c8554d4245291d366434dea52dd2c12f07248cf6dafd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "849b835867fd2c9ff22a574161fd77c9e255d7bfdd0bcde39b70768c4b235940"
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
