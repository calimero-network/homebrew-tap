class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "4cdbec40092a7848ed5a1af8d0ac4fb67c0728e5488196356491f69ae9814098"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f81109e2ede5a7427c2b44222dc75b0c8c19fc19c0c4ded7d0683c2e86224e9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55a64e58432c2a5448bfc1ed458a36a8f2cd9c1e1db618981904edae6e7e0cec"
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
