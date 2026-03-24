class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "cc137fd46440f5665abe5943242d18680a51e34629c329fe5f32253279a66d7c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53549b078d7d390714b6ca4ec31e4734e0f2b9c6ee94c67e9cedb19858e90e7d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8771e297a750a324b9ea09603e8bffa90d3f77beb4eccbf5e4ff0015c9cc00a7"
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
