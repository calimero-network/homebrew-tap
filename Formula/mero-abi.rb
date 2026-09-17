class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2b3daa00c06363ac82942775ce7b808e698f0feb2eadf74fffb70d77db0d4000"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d503597c39dd432c3e930a0c7412c4b89d610ce3eb746789f2221b5522493d5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ada8404ae6ca30739e9f03eee1eed80adcc0fb4acf0ddcda1875a24bfa9f4bc9"
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
