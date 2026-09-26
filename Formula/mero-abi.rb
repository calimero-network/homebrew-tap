class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "6c4cb39fab81ae8404731c0b77d0c5e2a31894f832c06facd772485e7379cfe1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3603f4e2787f0f454798267df19ddee7975392ce9d8dea0892bbfe484c3730df"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6db4b4665756cb352dea0960f92a07d972a3b10bfab36fcd0239c42e68653a3"
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
