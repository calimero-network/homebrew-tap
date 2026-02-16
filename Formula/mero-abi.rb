class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "80c217be766ccedf8a405969741eb6b007cebab14c6a39f86c5e8d350d683b51"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "199a3fdf1f9c809d70c473cfc6ffa4b909634f6788563dfa3d75d84ae0135d11"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efa3f9c2f8deb10a48ca51cd11c1c2853e2d78413c516b17034e35066c484994"
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
