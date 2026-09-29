class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.63"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "49edda6eb5f6abb87c28214b2f0b6dc9cdae08e6ba101f63e8a3b38e3e7c53ac"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "156c48a36d70153415187b2cd054345281cdb01c8cf10a0171d78ba8ccb2536a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d841adc7cc981911a842add06e9eb2b9e92ed578b8f3b12db5826222ab44eb16"
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
