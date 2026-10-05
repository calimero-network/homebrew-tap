class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.80"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ea9a8c4a2267fdaaf05038ef0ec47e784906a5707506a7951a7b186df8b00cb1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c6f3e23610e3efdae1d1ecd99132477693d4cc6a65068042c46b76619e8f4ebb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b484c66946ed0f170354d3c956cfd1780d766f03fe1807bae640a76bb5169475"
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
