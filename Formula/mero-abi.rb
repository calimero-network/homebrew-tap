class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "3f0cbba2317e26ab8bf9f2efb94fe792d9c817e216bfb3cd68cbf940e4e2645b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c32932a256377906ac2a2378db49704d8e3d9fe853285a67e6e1594b533f5801"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36c3a42df297a7cf45baa660e498f74d053ef046785d218c45a902c00e15f912"
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
