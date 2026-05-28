class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c39c5ffbd9edc4c8d7ea1147f128095b423315a26b16e622db0100813929be83"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ea69a49a9c9c31b7f42403e163424c5bcd0f3ce2e21c7f07a8f66d711c1ec01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "161cbdf17fdf597b56e45bb6375ae9d7cdb30ef886a6643bd9e98a2a47cd4d3b"
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
