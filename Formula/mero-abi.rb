class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "5b597c87bf31a62a13af3a4b6438adf22c3ffa7085330e4226c9d3045ab091ce"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "db53be14dcada1f3696ea2413adb55df953010e03c6dd10e1a5df8068fddf1b4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "32a4da49656c10af5047d3ea4b20e48513f92a33885498d2d4fda7c1335d2e38"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6a0b22009b0c2d0877f0e65505e163196b11ca84e74188d420c7411c632213c2"
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
