class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "6f16395ddf30187cdc8b09fe7ec2bbb6d422f1d89d8f9473e446b8feb958c1c2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "06bd1a859c17c79a2ecf2918dbc7e75aee4fdbb62014dbc3f9c0d53d4e0f3f1e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "083c4c8d3167c04361be5f6814ca5ebe8a92cb0cbb2d5c633c883ab1160cd4fd"
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
