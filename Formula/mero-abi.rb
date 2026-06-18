class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b76b4e7312917afe415232bcd158f86d09e8a8f92b7d9edb6e8ba55f761a9f85"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2fe76c1a6860c41ca358c65ecba00f685c12f1cf85f93a7dbedfca60528d96d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1644b05aada97eb75588bd917efb356dcad3db1dce1c044a17d1b96ff773dbe7"
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
