class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7278b75c4cf446d6a42aff3880228693fc55cc461b50c88800f811d4797ac2e1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5db21c7a2bd65496ee05f4424da8de0a3679fcf3ab4070d3e0374b499db09d65"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.1/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "01e62efff7084506d7b249734a04df282d6f429d293787eb7ca2734e3f7e14e9"
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
