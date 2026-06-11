class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "25fa5d61d5a2a6c34d7dd360e3c7df152de604d8e3964f8d17c53663e6a4c667"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "930479603a152ce1a1b03305a7da050ee64ba1c1226f0e67654f3e5a3663cb23"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61fcddac6e5734091ffa9d66430bc88f8cdd7a4f213c9c368c6df2eb20dc5ce0"
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
