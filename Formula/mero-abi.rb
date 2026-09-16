class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f8ca36e9e86b49d77e8facebbbc801889ee589084e54f4dd9ca2fe1cd346549d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d70607d0171b488ccc5c4315107b5c1e5fb7d061b9f3caf7b6595ef0b04cbeeb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.38/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b04ad290c51e4a2bebff3b910fbaff2bfa0121b521000bc54b529a6e76d0836f"
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
