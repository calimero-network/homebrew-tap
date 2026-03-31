class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "251b599a3c950334a33aedc0afcabb7392e7fd14e495b11f14df2a1a2e5f113b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "55c961ee6eed3712e4e55a7661a65e618bc5460903f38f3de651ebd3ebb2eac3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b5836606793ee64459b507f8ea9375a81b9410e391900647035beb92684ea3ca"
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
