class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.64"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6d596b78331124592427f71fbae57819464355edee751b563059fccd25816039"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "34f3d749b7cc3b8b1d850e80b2f1c71815b618fc3c849f5316a3e771d60e668b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e0549f8c73a8aa7905029bdc284968bc86846d2f3a41155eb569d13bafa757c0"
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
