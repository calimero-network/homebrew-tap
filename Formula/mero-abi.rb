class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "3e52c324a4b997b736124834afe1c0cd563dcc4b2b2e8696a685a97d1462db1b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c188569333e78efc21006a5192c82d896d8ead26483b493ba68a8a371a90e6d9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3af8fada56ca363ec3e7f39055ca5cd154d1ec06987501aaf8d4089f84f70b7b"
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
