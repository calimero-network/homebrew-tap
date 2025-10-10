class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "eea178bb116bef3a89d5b18985c3e1401fd524df53fcdcdc218d5c73b8c6af10"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0e15f61e8e147a67a8f614d54f94be93540ffc681c80dbb0c52a5630deb99a65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "47a42d62ef5a573070514a48c5e07817025fd72c593313f8e982cd50377bb743"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd17c9f7f8d2d59e34dc16898fb53cefd6dd71560c43e69f4277a8b1862158c5"
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
