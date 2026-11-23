class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/merod_aarch64-apple-darwin.tar.gz"
    sha256 "dd5ae1cbe007e635600e21609433576682ec3f20efbf5eddb2453f9e42aef30c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.35 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d2bcc259a4f9586aba397fbb2c830e3e54d7375e2d0ad05e37d50adfdc88b0cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.35/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "075d17555d689f5eb1f303f3125eca56755eed5789d18d2f9d9ff0157de49f79"
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
