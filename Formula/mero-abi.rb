class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.89"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c8503b3d852750f2455833467d2f728f36711165e299112366395fcb2100a260"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4932440b00cc0b405072140ab1d67a51ad4159510c0f024fc2f6121661c7651b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c66d352ec097bbec65366297229a6a954221ad154ab6a21ccc88db76925d3d9c"
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
