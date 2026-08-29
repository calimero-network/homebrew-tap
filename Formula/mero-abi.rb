class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9349ef111c498e4449f6203b87ff2b5ce2ff3515af1606cc39d9877cb7d6040c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6397b33a63c2a41ff366a721f6044ce4c78d178e2370b3f3ba962818a637551c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7729903dba9c280d4c6a5d29964388215cb3b94a15883054286300b94e954f68"
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
