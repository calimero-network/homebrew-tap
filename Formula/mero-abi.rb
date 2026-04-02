class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b17016413042b0b84b74c5faeb3fc0a354142fd0e22822f200cc17e584006a45"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5acf8a2d286c5b89645ec68e1b68108c3be633c650bb55d5654953687698ad7e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "158279dca18b42b13b2ad67e6f277b8cf1c1ec3c4634fce4b3841587006f2483"
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
