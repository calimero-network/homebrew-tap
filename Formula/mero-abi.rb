class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "5ff64ac38f112aa5f0a066ae7fd6f2faa5168828f1104da0b5e3d90475b4910a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5bf30e3534b8e9aba21ebae26354c3b1d00f2281cf4a680c8a9e9728e44510d7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b9aeb7e3a70d1201ee17c0eefec59d8ea1f7226ec0199d4384b50dcaf1fffa6c"
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
