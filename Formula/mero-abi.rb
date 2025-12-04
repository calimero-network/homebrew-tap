class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "0d808d783ff1ca0feb1f604a18ca3404532d997ad7f7e9f97e3499b4671a2f53"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ba7b1bbdda3a2ae8a947d207e2b5105700e200e4f2c0f91e9dee3d1b2083910c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3ff92e492c21353c6aa938483f94946ab20e41d210809909b0cfecfb66d671a7"
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
