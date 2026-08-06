class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "73c2dff0e1466950c1c57ead1cb38292580fa730571fab47ea7117509bad510f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4058d4067bffb2e0e2f1315603e1c97651784c97d287931777a0f40c94cdd627"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.20/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4501411dfc4f8a9e50a2f08479d07f2ab2307aa135f6427e232d7f2aedec43f0"
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
