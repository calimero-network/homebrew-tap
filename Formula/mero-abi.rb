class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ceadc92686cd4c22ea8c7bbb4ef7c447b3286b022379ad83834b05723633facd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ef55c9a861699390de4e78b94b70ea836943331a77878c43f3caf9f8e48c14a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.21/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0feec9a063a5f0a0fd63ee41218ea925665fef541700854d1fe43fb23314d55c"
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
