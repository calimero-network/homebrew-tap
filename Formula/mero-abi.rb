class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "0d8879df8d65de6f6b0777b12de888ce4da638e2667570c11a223be94fcf730a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "55f7bd836773315ec30d1a8d8f285651b3275e8cdf0c68209b1dd9ad3cf2b9e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca03d0be11b993659db8cb04426742faf254bdd8a77a0e84651b4c0c07e02fde"
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
