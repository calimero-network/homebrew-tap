class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.75"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "ce8265616a58b4e1042a7a4f8c51762266028394b4984dfcabe75039fac82b69"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b47f389fea9c805f53d39274dcf3ee6ae25c98914691ff948710feca23a560ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "655148bf71a71b385b7f2cf49f670ed08fc165fc20eef061a61abd09b13fb08a"
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
