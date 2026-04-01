class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "014ee2aa3568975e2968c3894dc052a0209eeab0dda67fe9fbd5cc37858233f5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b7597e456f340f58395d7b5765a0611a533118fa13ffa22e5e3e723ade2b8b6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6ab5b0094cb2d35c93ac845e778464bd1657a25f5ed9e7822532b03f49ddd3b3"
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
