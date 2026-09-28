class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.59"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "e3284dc9ebb4ed5ee113254f4e93a71bd93313ac065b103396f3a779ca7ce4f2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8243b5bdca6ca17caf2dcac78342ba49235884cb57ac5aea64d7cf3cbc990c0f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "defe2444cf83f77a9eec109630c55292199b5ae391866adce790ffde0d8072d6"
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
