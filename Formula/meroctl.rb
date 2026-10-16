class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.89"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "da645ebc9262bd99e1bba333224838ed06df3c358f401f0b183aff414b573f2e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c17f93a95eff882e3ceadd5351ae0a188d06fa17aa3298f6e18169329401d288"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28599367233b1c8bddefd568306ee446b8be52d32e829d7a71acb04e03ff7f12"
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
