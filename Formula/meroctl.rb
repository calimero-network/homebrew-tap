class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "76a74bafaa4957aa79feaa461e5b1f4020c2807400720f655ca8ebc7d11e9422"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.25 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d4db2b9b8351a7acc43f23ac72061aac50c193dd90efbc164a4cc598ca2a5a7c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.25/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8ecaaa622181f99f2dbed766484bb781fe333bcdabf3dd065db0db048f9ed04f"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
