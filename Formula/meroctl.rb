class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "30dff4ae87d28c6a47b1a3ec36695d30a7b66a3e3697fc079c4030d9c824a2c7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1b284caa34f00a250adb2bc3ff9d10bf4e08f83bae1a8374d5345adbbd892459"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "16a3df79d1d75218b7c17e3c3913750a3053f687899c78f5dd71524911a0bd31"
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
