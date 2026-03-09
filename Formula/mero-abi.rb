class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7906e4d16a8e4f273e54cc69f48524164e18fcc13679c8db7bd037cd1990c2c0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a0a25be7b8f77271155b07c459e25c96b57364d6d010ae4974b86adcccb21bec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9bd8f83b755c4231f8da73d8a62e4bdd4f50ad9185f517708579f5030446c236"
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
