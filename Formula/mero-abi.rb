class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d0fc6e9cff0cb906aac3673c10a0f92b77ee74e6e9e80ec403682c47c652c134"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c1e9e0d0aec575a4c7097c252fcd926493f45c10a56ad6564ca4e949ac2e0f9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "527cfbf7aa3c5e30c9164521d63b977b189f16746518ab9ed34ba4c8932c10ce"
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
