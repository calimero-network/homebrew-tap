class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9dc8f833be79159b496447358514a1fe8d8cf6fecf301f71c43dddae13fb6655"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "103f7c16bc7282b6d290c6e0ded844f9175687edcde9647b9b053282a5c60fa2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77c15a2b5651b0f4541f997733a83c8b09048eb58461723de8f7b3b52f45560d"
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
