class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "50e01083d7637127a40f493899f86fbf4773ba0f90d0b324ff67543fa788e446"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "3b0a110d2c3e7a66fc33d82d7ffa0de0cbaebb1a15acf5bc96a7beba5e71ca9b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e8a61b99297d992db0c5e099f79b3949376571770fb225a11000313aeec312c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60e1969cca07c7effb54d7a3860774ec09c8f91fbbe9723854afe6f4ababbf3d"
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
