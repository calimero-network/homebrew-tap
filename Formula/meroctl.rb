class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3d1c7224222d56cb2fa6987878d314f84a86a0f1257f21a1486844b1d718de36"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6acdad30f5f14b3c2011b127033f68127d915b35e8a69948753e08d702265ca5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8ab031ff13ba309e5602e7315fdd5ab83d1ffd5a1e25f0c46c5e0f6c7793e022"
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
