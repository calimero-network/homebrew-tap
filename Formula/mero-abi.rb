class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "06faea8e6d144398e8281414c2ba1f88a11081177f7f7150fe2588b9efcee1e8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "573c0fa399daa5b9385130c326c9f4b34727845942ea031383c12c58e473f619"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d7aefc6774b1fe20deb44b23aa67c61edc4f31b7e7faf511a01467e6ec84381"
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
