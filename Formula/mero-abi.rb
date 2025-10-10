class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9d79a983c3c12609ca7463290d30457063e32103c754a0903c92972c47969e50"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "00d12d1cf5054406a1c87510b2f38c3e2d0bc3a7923730f0912703c1c31162b6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8f3a6ea9b2775cb96dca5f9bce5622b25582b978329e8d3abbf5a851bc32a50f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.2/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c620f729ad63de0b3d76bfed27fd279f4f7439b46a305176f48a535a68b0dce"
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
