class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c32fa022bfc6cabd11d8ef9b16320035c300a01b0ea0b2cebc51e85a22f25abc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "31345e45909a0c9ba817dd2901d2d6baad988f9e827325461784b3817ceb1ffc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a9a0e30c81af3908bab9dc468bd95a7f7ca641b835fa87f2d9e16f67e1e5ee6d"
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
