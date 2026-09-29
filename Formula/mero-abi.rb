class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.61"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a31d4ab7c5feb48dd2db840265acc8bc0eb819c0a62c7d9b4f08068414174eca"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.61"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e3fe7a5aaa886c38d475c3b7efa28aeef0793b0aa148ece7041e9408fc4f559"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c2a640b32764f54b4665e229dd71edd5f10466f939862d2dbdd9b69da3bdbfc"
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
