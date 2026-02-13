class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "31771718365aa19571422e4010fc001ad722118fb95b8ea012e4b038a4569f07"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8414a79c8980f99cc7293f1bb98af977e425480762935e832f2fc483deb3dc10"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d8a1d0556afba5b30dcfebe16d5f4455e1ca8e077883d2470e23d1c0b970221"
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
