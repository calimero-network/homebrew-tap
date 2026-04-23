class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b9c0a7547a01dce3fe1ec2b0cf0c4b0d40c9d23bba0995102c294e9965bb96ca"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "776e14be302cb638e7b78309e5818a8727fade58b2fc4f4d2b7a263520a62bf9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc16a8be38f3642856effc94f2c575992abfa159efc9747c849ee779a1f193bd"
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
