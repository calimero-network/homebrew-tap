class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "69dee626b78d03fe12102ea9bb509c719e4647d1222e38f284b251bd3fe0208b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cd52f03eeab3b2cd27be7b46c5d60f860ac4dd40e53ca4bddc5ad6ae747f246e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.50/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b977eb28ea8e97eacd4382c4e6c329c0b635c3f87e2de09ad57c6e33390bb07a"
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
