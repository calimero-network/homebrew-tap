class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c69fec4cc4caae387e197a87f4355daaff5b39bf7d6b7d1a22a992e5b1e5d4dc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "18b03355d58bb6ed5f0473f38bd6b18adb3c33eb97a877b4683a8f4d7c567f41"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a9c079e9b074f7491586c1b75b7ca75a932a1e4e947e33bfa700f2e9585ba264"
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
