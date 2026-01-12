class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b4704ea68965cb22a9973eb5bafab9dcd0ed95dcae1a4c1ebd4ddf5a2116c6d5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ab2a60c99e15f5a47e25af95a5192c7e0f27121bf23ccd895729180bc164cbb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1b651460a215d1ddf1ba80fe1129a6a5ffe7ea1452cb8cf5da89bdbb00ca4733"
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
