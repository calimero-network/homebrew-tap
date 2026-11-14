class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ed56f5db805dff64cf1cea0ba7ce8f2a540088e29bd33d805dba2f84f524d1c9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.25 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "61b4ba6da65437272c35844d2341adb7520e4dd2b25f20f65c3ef2976fb75e31"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6764fe81d5cfc942d5464da2d840f80152f391976f699b38c492a1947e4ffdd0"
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
