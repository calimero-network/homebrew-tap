class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.81"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "12da32b313aa3e03bf623a4309949e69c6ef9c0fc5c3cf31ee3099af0f16664c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.81"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a3e96c0e7d334be986a82537db8e50a72d61bfaff8d1a2796eacc4b7e3bf7f3e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "80dbeeea02f6d9b5dde939a60712cb263aa6ce26e592149da522cd5079dd6c9b"
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
