class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "681373c3086b34c581a86145219350ace69ae46e69d69231a6fc3e4725298629"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "cc8519f30156a350a7477e5d89a04f131046f7f3af708b7fef3429021ab182ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5e04ec4d57d943ed57ab4de68f0e03df301a85de27d015fc46966d9bf51415bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77dc0ff5fdc7d6ce026d461d66d195fce201f94ea4325e757aca9894580c2a4d"
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
