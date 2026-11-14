class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    odie "merod 1.0.0-rc.24 has no macOS (Apple silicon) build"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.24 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.24/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0f47a2f30702c61fa9b923923f7ad5340248ee7b519a441b676d3cb2067ba2c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.24/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9629695d14d52447e8967f1adc7251d6e78d6fcc1e1f4245301636ab3967211e"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
