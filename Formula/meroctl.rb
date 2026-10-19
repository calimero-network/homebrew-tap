class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.90"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b9fc65f97dcd838d1e7bde1872793be6d2269c731d04a712240786ab41645de8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f3a02f2c5fb9b1203902b1bb52b0de5717731d64ca9c8f0f1b3e90a780fed9c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.90/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6094858f98747cea2d1562aa93b5234982a4ac8bdce3739444f3fbeaae17cb32"
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
