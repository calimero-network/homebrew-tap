class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1de9adaf5b8055e8e31fba47946b72367e33baab52bca6be58dff7831f3b6405"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "91906a5822f0b335be3806d1a65729e958243ba09de40d63c1c95eb1aae50834"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.23/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d88de3a6709897b907cfeba75e4331329bec3a1db1e4aaa6e026e3ccfe476a2d"
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
