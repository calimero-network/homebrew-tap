class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.51"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3842f365bc3d17ccd3c454378325497ac0b4f6f5566bc336c5e7a3169885f47e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8bb6e30d454c8db8f5bc1d7d7db43fd8df69d529246cdc6c092b6fe7bcc3cc25"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.51/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ddda81a707faabac1f9971abefab134939bd42b3f2aaaf8d273e5d616b4cb2d3"
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
