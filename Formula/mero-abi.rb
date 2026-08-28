class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "dcf49eb3ac5441d65f31ceb2155468527bc40e30583264719517ea9dd80ab9bf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "52e604c1eaa57702c64bb98c1174c769cac375bb457f90bb830feee39c940484"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db6057553451d29ce823f8c51ce4db7d691c1357d322af9d005d131fe83bcacd"
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
