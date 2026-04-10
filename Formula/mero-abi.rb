class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2169c34f25ffcabe54690fedc0a054e6f67d558eb3a6aefe89eb971b2793275d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8215a50461adf6e6a57bbcfb7bec0d0d13680aa83e37699a3991ed4dd6c6a4a9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dcb94bf6fb0f12d02c27a4d11ca2cc1f3f96e42acf5c1072d85343a8d6ee38f0"
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
