class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "34ef40e9272ed51ccfb6387a27083d7841040cdc19bc1a96b0afb05916b9fe58"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.23"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eeee88a2cf2e404761810e209da73460d901bf559bfbad173711c1838ec401f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.23/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6cbfc2a48be55fc643d06a133f18a19cfd22319db5dbb3a158d4e51b9357c4b0"
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
