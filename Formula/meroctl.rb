class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.18/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1474955385880d46cd0890280209ead3c22a96ba2c9fd4c27c670f69066aeb11"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.18/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "484e32149c1387abc77aaa8d069785dab01c142f4fbe8b95cc7fe5e6f3985ac7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.18/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afc0fd9b9fc265e7bc7cc8344ac59773e5898b8c09eb6686310dbb1848a2bdad"
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
