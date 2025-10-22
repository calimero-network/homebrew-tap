class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "4f817e18711393452ee88b44135d8ae870376be77f05d57db08549d8dec18231"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "84f0d56107d4a121893fa6e2dae980c0d6553db8bbbd7f14e5808bf3af18116d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e3ef6758d276da7e11c30ad2a5382615f601d54da36bc04c5ab7e0c92145b771"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f87055da43acd633a4e92eb7ca163f49d492f012f4eba845eb474be6f038faf2"
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
