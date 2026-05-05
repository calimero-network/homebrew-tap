class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "98e304f0cd3eeeb478997467b85ecc32bb5980e873ccf7940fd256f3e95a1bc2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5db93419b5512f0a65137258382382c9a3b8e52dc33de1632479185f05fdbdeb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88772a459bcdc48ff43a49d52e5b28b5f54daf94bf91324ba250a0c1548b8529"
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
