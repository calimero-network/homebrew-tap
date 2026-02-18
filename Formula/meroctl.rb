class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "08cef62ca20bbbb4e235cd55d6bfc64899e62117d04f47de99f177c874a9f4a4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "afdfe11928874659fe944a126b422836bff8f53513d53058288f53f061bb2b9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6add3eb5ee80d4095e0cac8b92495d7091dd9eb014cf2b8e8f3793c85de91ec7"
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
