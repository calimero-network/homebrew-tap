class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f23383bca12f9dca5b1e30fac3062e31da410be0c828b5487ac926d2532be7eb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4b528dd3069853ed8a14e03bc7cd6de471f61bfda8d76f79cb60873c8f05b2a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ce714addb9e799cff7a9ff738f660590f55a8717e1eb03bdcb9da99214a6faf"
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
