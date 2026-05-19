class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b76c3f50ec4ebecc546d85ce6b6e54c9a8cba92924fe9844bc6affa866be82cf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "56c5351afd182363dff1c6ca8bd80c8c5ac2ccff045c057534982cb699c28826"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44e4fab4837034d50b6210e05d0a929ab60df496a67c5e411bf2bc353ac9db01"
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
