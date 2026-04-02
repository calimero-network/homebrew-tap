class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2ed7e28e4b3559de8ceedb8403b3843d034dfc5f73fb5cee27a77a91b88d08d8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.17"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fe3041c495548fd6b49c007058054d05d72ecb34f56ed5e1d5b848cac3973583"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.17/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "46f96bbd7551e405a512e41e422f5321c7b0f6dcd801d1a22290abd7575e00ce"
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
