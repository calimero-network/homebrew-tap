class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b380eb660867e0a7776adfb4717eebb5dda4388d2a4074b85ff1646a7a336e3c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "11521bb76a476187011c566e706fdf4430bcb1d6404e9f89bd95bd5b29d1fc9b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ff9169e46dc9cfbacb9eac985b5f0f05cef8a83f146a19aa7a16dee70b820c6"
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
