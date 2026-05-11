class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "544efb8fc74c345c81a852c78451f669ecdd71cbe3c5ac7773e6253f6c7ae9ed"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f16a3f3861cb111c10e89ad7d7ae990682632cbdde9fc92f4b2a1a7f2aa12714"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dd0c7e5dbcb42141bc2f1c3f865933cfa736fb466ab8295ec05156256d64c787"
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
