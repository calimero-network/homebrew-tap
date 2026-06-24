class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "56634f2adb9469b7374185e4896e3f91c60f3c4b169679a7cb836326243376eb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0046ef016cd473668d75f276ff6d737c1402e5babced63e31ff650fbeb9291d9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ee8a87cad3447face94266b4d61e5526194b17c12543f56aac8e802c22d455e1"
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
