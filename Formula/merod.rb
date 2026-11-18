class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a953edf352897fcafd11b053f056af9ea433b10bd993d11670bb57e2176d12b1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.31 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f704f322a53c05c613bbccea8bbe101ebc994a3420565d3eaad5c383de9f72d8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.31/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51acf36a76da0c2ce16d68f2af5489154d10cb1afa6ac50a7346bfe5117219ae"
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
