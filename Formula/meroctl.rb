class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "654dc5d1ec57410c218f7fb36c1124c8d08dd867f55e463afa81b13f057988bc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "885efe1bfd834da2dbd64505d8f9869e17c6a29402509a22a9857697039613a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d05128b9d0ec75aaa0ce6fa499d5735f18341280518aa7b3efed2d7d36cfb666"
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
