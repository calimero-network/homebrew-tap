class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c17b27bd12888f073d6fd2bef912103323d2cca639df3d2a8e492acb79470376"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "684510fc8e7d3fe178da8f9561a3e5bebcd3aed861b55de3e3e89dc90e7513a2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afc23287724846dc3bba738b619d7b403964cbd4aba909ca564ca9b4d649c5fb"
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
