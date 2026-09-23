class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7644467346132a71468600e037e266cb0fc8e57062a10af006229d38f4c4ef74"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ab3a1c52b2ab19ec4a0c05757b3dd5f8fa5a163a7b17af9eaeb614670666c61"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "096f84ec9610e147994422c2cf2079a67057af76a89f9ccc5cfdacf19544c2a2"
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
