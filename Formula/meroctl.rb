class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "734b343f809146f44e73503b7ade13455271b5cf5963bc8c2496ef900d2f7991"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e0a2c1c9e26c7301f3c596e395bcec84a29e05154d4010e3bc6e7d8289f8e75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c8bc5ea33dfc2d2c05ee2d34481fdf8d0fd24b3a1d4a272f73f5f0c28c64ec6c"
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
