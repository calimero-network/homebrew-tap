class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1b0a85c1d2552c160b1b25ded646bbcd49d7bf8f94f1144917989b92361ccf03"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd600353158bba68447c2e76dc82504d701121680d24233c00fc619fa2189016"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ec5da919f36add726fa198cb1aa7e0bca781737de3c0a1117d19d430006195ba"
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
