class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "0d47d49f8d715015d1e0f4a2241fe931913665813afba53cb2917fe41ca776d4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "62b407e791b28511b3f8af892defd6ef7647278bf29ad65c89eadd78b5c310d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b37239c9b73b1c9d7542ef2092c6954ae50687841ce2e8bc07dee444769b4d5"
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
