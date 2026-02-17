class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2cdb7b2cfa09eaf119d1440579c1026191a4cbafb7abb835718d225b38ddde70"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "26e9a9991a7d548e4fdbc6e27af13449ee1e793900273245a2b89b532c57e61c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9b979c7c2b283cc63df8a3d07fe38e7cc9c7d3797cb6ea82bb9179c74b1b0ec2"
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
