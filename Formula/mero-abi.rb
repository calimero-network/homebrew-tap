class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ab35ac24f624a44936bec3b310cbc2d611eef9461bc11aa4d1c36b355f93faee"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d7bd030689a1fd35e1c730f43a5db5a00022ffd5da762a5193565675e32cd35e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0b6502086b052f6a6b4c12e76285aab482c3dc1604c0383431be5cfe95d80135"
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
