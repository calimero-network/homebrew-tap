class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "fd55e62eca6cac003d85505a177d216517dc514be96e6b2c220f750075175687"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2aacc99e076f82aff3fd40cb7798ae5ffcb9fce0afc9c3d52ce30008e15b094e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.32/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4162ce28998045a2d79993ec4eb51197bde9f1eb6a35eba629a77888f97c903a"
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
