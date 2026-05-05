class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d80f36d0009cdcd8118885ef8e589050dffc29de022374422026bd8dab4f820d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4feb6d1cf7b1b4cbe5a7ab5efec4bd0677280a5326fc25d965f95b8dd4672605"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.33/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bee6f11d99070f93a998003f6b4342c390c3c7d70a310d19ce61271bf3272ec3"
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
