class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "828705e916b68d7e7eb96acf1a716d48bf8d434afaaa9d4f00a1baeb149c319f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d394a1ebc17e68dfc870490a52852ed835afbf99197f82ad5829052211136bba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "27fd891b18c8a29105d77055a9a5879ba4653dc7ff129eef424f79a13745ca8d"
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
