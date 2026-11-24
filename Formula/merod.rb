class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/merod_aarch64-apple-darwin.tar.gz"
    sha256 "bd5eba4ffdfff2d17d97742273d696557542231cbc51a3f85277df2e32b91a27"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.36 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e64901c9c06b808a99c2f42517198f2012530442455a6390296e4c429a512a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4572a947b35c5c314a448895a9b83a9fc67f88c8b39ef4cb3b0fa7eb5d8ba099"
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
