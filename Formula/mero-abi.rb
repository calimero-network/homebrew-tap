class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7b9ede799ca99884ea18973459fa2571757519c8d75373a07e8baa38a9a9e2a8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d54f4ef728af88c30241f2063514e4b05a4d421e4bb9aecf39467bb604d78e58"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3089d82b00be9777742380cb7ab4b4fdec571b831c6ddce4743cfe65492143c0"
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
