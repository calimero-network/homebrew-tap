class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.68"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5787dab6f0d4909a2c383f8d5568747d7181fac6ab00c8696647cacd8349764b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ca7ef304bc71d2bfe5d5364700ed71942245d3d77dda472c80e84454b41c4402"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "021af6be0506717fcc1234339aa0603cf486acf5f5be55352bb969034f167216"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
