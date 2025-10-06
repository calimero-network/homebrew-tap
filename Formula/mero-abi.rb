class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "6152df50b4bf131c52022d03966cb90d63ba4eaad3d8109c654d5438b4e2509d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "dc7d818196b087b5635295eaaa960766bf81256cb2211a72710336828f746e99"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a67df56b2db33ce7359b7ac5913846edea9c4c17a9af3798d720c756f9c270dd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "52440ce7409e56d1f29d94820e7f0fc3d664935050d3d52c923a69a3d4b6ce98"
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
