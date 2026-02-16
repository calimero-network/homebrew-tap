class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "34ee2fdbb7d2001d0ba3263a00ebbb1b34594d0ebc43552f3a7c80231db59c35"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "99f3e3c7179b6bab879ff7930183be6854db8cc2d2846e731b390c37078fdb20"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc9c111b53fcdbb0ed1bc3956f966abe2e45b418318977bd007f484ed3fb6032"
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
