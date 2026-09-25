class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "fbc8e96ba8ada7b5da79cdbffc8ba99373ea3384c6688597e94442de143cd7f1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9e0e396fc5d3ecfba24492bf1a988c383fe3d4fbe2a0423c02a44e9d4a185f23"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6fa03f6c476143f661edcfebb7c25000f1c38a01739df64ee4b475dac097e765"
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
