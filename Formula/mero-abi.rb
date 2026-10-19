class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.90"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "042d28c0e30239815038ab78e62e471aff80b3d0c86ef27eb1f6b180d4bc22a2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "50be85838546dbcef458c2c719b34e41c9a1e890cae3d1305b650196b1addc75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d9de7f893630afcb4baa83d62e0d935c9161cbd24f4184a965252c8e5dce5903"
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
