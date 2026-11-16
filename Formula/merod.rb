class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1c51d244ed3e528726e50d567e4abdf08cbd7c47197ecb4510d8c6b4d1768b53"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.30 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "863fd79beac35b35492fbcb675f840702634c10c6cf9c34e7f5e6d118015dd43"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.30/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b784ee086d8216fae414a412e8d616e574fed45329cdcacab123a07489ed987c"
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
