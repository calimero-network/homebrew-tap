class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.85"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "64fefafc4a4c9d734e0c226a8f12b28058db23db5730ca74174a39ff8cf9f0ed"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.85"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "da07c4cf4d1349380e752cc834b8477227dfff8c340fc8fa04a09b310fb89b0c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.85/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84b742a19e3bf101d5f0c943fdc711913e03de4f3b81f46971dea64a41da27de"
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
