class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.79"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1b221a07a1874868abddee12293e2c494b4298dc3d043ffd53ab297a43274f10"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "802c14a277c53301fff25cc75cb6b0e5cb98d3c9fee89192015d35a62b5c2450"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "63f6a3067a92b5861bb93322c6b6c435e1d72c4bfa2490130b8dc74534aa633f"
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
