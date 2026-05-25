class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2bd6606c6820ca7d244807c4a6d16da73e553b2bdff756f8a251afe296a5917b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c67eebd0837d7116209fcf1cd9ed717a43df8d2fd91f16a2fbe915d5b9ce2a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "691d87172dfa19b9610f465958b41f7d2d2a9fe600cb6891a056228434cefebf"
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
