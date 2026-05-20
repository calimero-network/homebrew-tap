class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "14e4bbfe8f51854c8a3b085d70d9e764cf8820049c425172d39da0e191d977a5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d08d567211224758466bf3bdb45d96328621bfcba1972973f1b4cc5023d2ab04"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "78d8b8327704c8e0a171a83a7c85e7a2d3e33c684fb739060cc8ab723872a2f9"
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
