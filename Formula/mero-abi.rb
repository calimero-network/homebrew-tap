class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9ca8f2e453008ee2900ed50c4b7009227235dbedf524c902ab482808b1e8ec71"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "37ba0cbeeca687b332c6e50d74956d65b46950b94f29011f121d0ad37688418f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2362a918183aa22578c117199ecd18aaa02cd7cee1cb28d93bc608a5c1a81e64"
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
