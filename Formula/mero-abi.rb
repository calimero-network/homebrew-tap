class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.57"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9dab89f577a51c8af7d2ef81ef1b3b99be16d865e3b5bf59a463a5860607a592"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7845fff6da0cd6ac1f6b4f77432c115711f163d965b02204cf05ec325a948c8b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a1600eb715379ffde171654cb43c4ddac33b39b64938bf6f70208e6ed5797e59"
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
