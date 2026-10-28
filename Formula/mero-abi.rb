class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8572d38b3bf29151943cfcc7cc8135fbad5ce4054e9754ebe8d13d41b410d8b0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dabdaf57691b0f75c7c09e94c6cc3807c4994ef78fc66a5a85187145d47a7d7e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f18b7666e16d20826a913ac3437c3b09e137c241b0db2899bebdead4de563b5"
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
