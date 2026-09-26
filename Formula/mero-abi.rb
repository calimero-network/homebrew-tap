class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7270706f463c1559c5bb0a69f861b31355bd1b4491ba1a31db3019d695dd2098"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "caab1ae52d0cef1e9250e1f57b4d2b7a17e43a75f31a9c8a6b9acb8d7536c426"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a07685a7961854294284592b6d73a3b6e0825c92d1681b0a9e7dd210cb4797bc"
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
