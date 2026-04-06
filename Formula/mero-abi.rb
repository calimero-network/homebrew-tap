class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d813aed3cd463f2306e3077915a2f800296f466e278cc9282f63f0507713263c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "15ddd9fd9c25ebbd6ed2a5e15d96f1607aa2c3cc5ab2687d351a68771fc21034"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.18/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "574e22eb20bee847c4a9ba68ab205df643c7cc2e45716567bf1cb08783235bc4"
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
