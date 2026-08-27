class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6955cc9802941c89ef4c143570a582b68df46ed168f04dc78ca8997eee53b927"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "adc77602572be154bdde740e6668ebd6703b974bb40ec4a739439f63d4bc7c20"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.26/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a8739bed7dd7e9b5fde4da09bbd8f0b40bbe2d8a1ebeab661802d4f925ee3b8"
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
