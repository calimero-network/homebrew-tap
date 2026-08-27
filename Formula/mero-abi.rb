class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "a6b69a5021590ed0b7816f946a84b07cae7bbeb6b0c04c5e735196d1ceb1b040"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "57c85222b9f3280e077e6c4f566ae76637d24bf02a73e2abb717f014e0488a5f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88e983fa2ac3d631324ec525805699dfc6931955a435afcc17e01d052370747a"
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
