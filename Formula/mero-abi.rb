class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.54"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f081c2d0427812572b03850af5238b98ce4cc744d4dc53073b1172b6df9ecc92"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b552a58fd45dc3cf7957cffa6e686a74f4e95141a3176409194ac1dab21b95e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b5c28e6a478a364efc9473978afabc45f2dbc4dd1f39f34091f44e15aa77332"
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
