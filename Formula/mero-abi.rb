class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "86b91df3cf3c24bcfbecada502acf3d6dd4da04aeb487ff1254c9dc47c78c8e0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9e0a48164724a1e2d49e3e7b2a37ad507705af5e5894c579f911e6b1a35e5997"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "91e90576e1d4b8d18e2df9253e2ac566eb40c068613fc830e16a3cb3f3fc5807"
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
