class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "346ce58670ff08ceade3f29721991821ed4d04b5d0e8a5dabc289939cf09d9bc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60708b69cba29532bfe47005b3100a6786a7a5a6582438025350bceedbbfdf23"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "87374f8b3f7c01dea1ea1342ca4f3bd338a8ef18a04302b0b59b450b6d316df8"
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
