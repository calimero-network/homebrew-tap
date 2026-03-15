class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "7b8f40f7e94ffed1baafdcda7c79b5f81a4355c339c141b8fedc5ea56b71bb2e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "88023efff5a7d598bf1d1724cc8a136022f7fda3eaa3d2e8a2c31411349779c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.6/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9f1dd4d8d68e9ed016d97d430375509f55a423ec763c27ed2a10f7d0f0a6becb"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
