class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.68"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "1c4af57b9ac82d25fc42f1e4c697572583b71342d8017fb2aa1a81ba15616459"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a3caf4e48383fe31b0a092d9651d3a199b58017efc7ad8829ee87e7eee9e7d24"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "808c71d92701664395f7113cdd617939f7cdb1892463af7f1d34bb6a7c8a1069"
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
