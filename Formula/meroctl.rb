class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "fc558f0860a6987be26a0a498ceb970496f818bea86434b9d15efa7ceb8b334b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.37 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d1bc62960f09d6d782949598a322775659f66fcb264ed5e5ef8b90c9c86c6b97"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.37/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "66d4f9ec565ef209dce31cf3764ff9be560557bccbcb56f220bdecc84a48fe4c"
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
