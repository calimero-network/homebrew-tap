class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7f724994f7136139a01bd6ee8ef9cfda41ae09fcd20e8d710871b7378cc64f36"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0ccf7bcc3986e10966e808bc73b2413d680c11a5838d06e79e501ea8a2073e03"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8d0f50b5d5bf53348dc0cda7b8babba082b6fa98ad7ab849247a8a06fa8fda81"
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
