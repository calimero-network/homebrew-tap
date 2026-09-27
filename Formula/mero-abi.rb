class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.51"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "efebb64c93944d7593e54c1f4bd0012e8e3b5b84b579055aa439de8f8c0b48d4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "734cab33f900ef9bb4de575e5f5d48099538c4deb16b41fe68c138f3498d0891"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "359fc0afdbe44ca84472d22dfa23a45050e6a99f8350d0acf8cd60d2250b9e59"
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
