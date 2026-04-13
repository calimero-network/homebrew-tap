class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f94e0bb1f1f0b6dfa1763bb86bf21cccf4e1cfb716127929f8f8d3da8336afb9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "866e2c9c61eef2ea28f022279f95824c64604137aec35b49eeb6b767ac1d8b95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00a5074a60fc32fb3f04c810313e3aa32bf73d41c0d397d171560e06931cc206"
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
