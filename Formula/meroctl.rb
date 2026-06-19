class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "aa5bf685624f79d595d7b3238f2aec466636e106571615e0b7fd836e19b507e1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7453ac1a24265693d8ea221312dbb026ac7447ca3d7220dd07bd2e5778f07bad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.6/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d034c937940bfc426493171334a5b2271c8e67255f20b5ef83fab4aedb3f5258"
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
