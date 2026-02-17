class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "64b460dccc7b37ee5a59251c42d29a04183b595cb3ae801a0545728a10773a39"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c95e892c4616e44b912689033703a42ea97e19b5c0da2b849e996f1ed615ced1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.48/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "89c4905b09dab04774979fe0fbe891144e16312e15b757a834cf65959e990176"
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
