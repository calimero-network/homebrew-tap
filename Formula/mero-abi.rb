class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "91b0f104c4e4ba835545a5a890c20e8bc0acf06d132665da4fe91dcbf4336ea6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6488aeebf2bd4e7d1160d91cb0239d9f6a4bee41ef2dec0ae5751c6f195c03e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "611603b6874e9592e6df9c4f3e5dfa5ce49de76bfd43603192f20141783f7640"
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
