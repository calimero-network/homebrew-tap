class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "67e36059be20c7898260e4d4b426e6ecb352205b65f1e244a91475722b9b47f3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6fb09bfbe942b56f6a1a3d0b5e5cce826a04afefd35c189b24eef83e2428290f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f33135a0d86877ade6df8f952bec356433bbc63705c57dde55acacedc759224"
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
