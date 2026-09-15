class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1be54842b8a8e9c2246110273a9604d1ddc77f410cde5b618d4f145278a021fe"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0397db995a4a989714da3593693d14048673cdbc8d82050af263a634272d7185"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8aeedbfb88b7a4a2f69599dc75c98e87a35ec140dd0bbd1b7ce733faa0e4e714"
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
