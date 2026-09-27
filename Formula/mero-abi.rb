class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "6540408b13acb9046c1e71029590c847f6f3a8bd8aadf86145d8a9f2f53f90d9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "86cd5b0c8ab9819f7310601b10e6d8e45112f840c46aff633c2f8d4ac25e6025"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d89b8df7186ba85e37cccf796b6f434aa192d8a006f5835b20dd775a5eb24cd"
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
