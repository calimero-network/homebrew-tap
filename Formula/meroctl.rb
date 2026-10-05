class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.82"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f2392a610ff6b5334f775048120bde51fc319efbeaea3c196002b295d2b05377"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c4a996d585b0f5e082b2f63412bc311ea33cd8486cc0c132f3cf8d9364d170cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9d7cd10e7ef0dac9f944534497e6ff6161e98562bbe085d10300d3d93d6290fc"
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
