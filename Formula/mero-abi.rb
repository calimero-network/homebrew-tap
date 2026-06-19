class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b64d34e0ff8837103e43f62c326b45fed8ea1468565602d879061daa33394850"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5184cd9e64224de67254ed5d5b09a3ff998b83fd59bf0e5d38c154111fe77b5c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1854306d24512b61ec17d00fd9931add49d0fb94bb8e8efb3a100dbd2cdc3fa3"
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
