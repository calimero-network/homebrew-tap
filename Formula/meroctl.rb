class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e567d7feadb954ce637f01ff624da7d427671dd511a8c595454455511c0c2da3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "499de0262904d92ad950dd9194258d5a8a7f2ddeffec8232f9f6e0756e5d5111"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1f0e25a197d2cdd16ced2d019ba6ca022a1c5c3c30a6d7405ce429da87e12cac"
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
