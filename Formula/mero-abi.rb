class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f7e70063e675e67271c70e12e1ed6ace3143aed9fe8b40b1935bc42033381025"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "3bff67ca684c3bfc19c107d70c17426e8934db38dad93057d99ad9c475616710"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ff9c94bf538f618dd48a5eff446abbe4670952d6869bca9ae3c43f79da0d307"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf6eabee4c6caace4685520c8abc7cc901de78a767b3e3d0293a7e166487ce25"
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
