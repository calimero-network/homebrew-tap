class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.50"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e9db1da066d10fa032fd8f10479e942bff7df3749d2a9633decaea5db9f55518"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "15163e62ba76237a0851853539606ef3a74b2f0935b87b7b0c9e7d228c5c005b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.50/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "499d5bc41739f90fe05b33fe02a10ffa2fe5c9bba13e8f7cebb8b3dda158273e"
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
