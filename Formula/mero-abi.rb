class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a5e3cd5e6e409b65513f8caec6d86c3b15f40258baa7c52c4698eeb2f82f627d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8d1d4290c8fd9b750592dc7d01b7469c0d5979c898abd6b3db69494b2441720f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd1a623d5e3fc80421b6b9d1f392e0d1fe50a790370a1cc31d71c24988b5b0ec"
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
