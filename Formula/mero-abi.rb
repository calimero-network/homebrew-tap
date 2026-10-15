class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.88"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7a429101e0ba6d74e91e940c4271694b62b77adaec647ead879ad5d6015f132d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bd6e52316b80b1977c1daef9146b5ac4c1a707ec9797e3e4f7d10296a27fb24d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88aba3a5d64a51617e9c3bf6d1dd761f0357695b74e2f2c476d604678fb81ea3"
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
