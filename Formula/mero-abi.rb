class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "5e03c87bae08106c7f9f75396f5595ea376670365067c4fb1b0c67c4ee30e4df"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "69553de89ece9bcb2323d858ca108e5bded2ef207f72686560148210d3bdb245"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b19cd28a5e74bc5c758317856517dadb961a9b32c5139d313c280f754d4bd43f"
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
