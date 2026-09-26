class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "839d6f16775b6d5a23dd4f1896dfc23f10b06e9c1c77ec55bde0882b09807ff8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "72f3e825abc5b6142f26c3bcb8de5e26d66b05fd09654d672c07700781f457ba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.49/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6679b4849705a52cef2469af101b692631f8d7e9e812decee0f8bb037ca9742c"
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
