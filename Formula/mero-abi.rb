class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.83"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "0f52500a3e7619677984e59f07e320f3bf3f5d340acddccbda81fa844253f67d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "633d79d02bf2c8d8a35ede959531a75956b426f308f41cf634d36a90bf34e58a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "64e56add6802480ead46b9f814b51ae4e37619355cf4506ca9aca25f9cd9791a"
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
