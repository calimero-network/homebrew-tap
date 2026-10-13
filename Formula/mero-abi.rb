class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.84"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8470776ef1b25c9567fcb03a78f6ca4a2782dbfe4da2d6f090cedd31ecf009a6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e0d27cff5d2eaa89dc75d785b39b6b1913560a1a267dbd55f5658aff99747c59"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.84/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c33e83a5def39f70bcb5718dae839ab4cb81750e592fabfa9397eedc7605a5cf"
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
