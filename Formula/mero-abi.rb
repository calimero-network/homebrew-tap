class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a70ec3a1bd50371d2b37065298c47f241218b57ccbe6d12fe4451e96feb97c3d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "daa880259ee09953ec8700bdc824833e78b90c72b17740da688fe5ad465c73aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.25/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fdb4a29e03c826a4c5793463d135d57aa5c531dd79df58d7429f6dfe7841d0d2"
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
