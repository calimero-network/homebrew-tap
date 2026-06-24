class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f6edc8cf7e9b7cab552fbda35bc8dda3d414b7787afb2c4342cab8aa14e93f7b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a58f91381372a5e8e86659f92057b245dd7bc845786c3cd94b5f23c1bfe7a996"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a1f8b7c860c8e1f8c732a29c5b0064a7429c929a3f33df0b7161c5e81f03fd1d"
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
