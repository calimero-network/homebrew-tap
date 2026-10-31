class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c2678aaebe18eb3a7c710042fd0e91c0291f83a1550cb1662b7f2981256e259a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a6076ef64579b673cc6e218d45716071adf259fba12aef79974871442b00e193"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.6/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c163bd3819ef9921492912ebc5a64b5ca8ba49fa02d9d0a44b1276643bb971d"
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
