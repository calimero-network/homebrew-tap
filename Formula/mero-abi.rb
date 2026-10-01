class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.71"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "3b059e1e6eec5c4ef76a9377b3e37019ae5fdd45df8ad91ddebdaadf9e01341b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "364a8324813bff1c5a6d48976c528dfe7774852dc1cdbc15a40a7b74b9b1acde"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a04c9281e1018502311b2620dc234f0b55fda32578688574b8bf5a9c3f35ab06"
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
