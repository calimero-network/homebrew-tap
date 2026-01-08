class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f7df9418413ec4632ac848355ade811b34ac95110ae6a2c6f8b7792997b3e43f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "240edc510b38368538a6a8231c3210519a38a3157a1a1624202f8a23e5ad8d28"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39e2b32fa39f30b2543dd94e2ed2d50f1fc5e966155640a36da3c53bad8249bf"
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
