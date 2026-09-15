class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ee57478e9863678a047c7e7dd5e5f150149b01346ed68434ebbc75dc9cec947e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "db7a33443112d5e1f923db0e258994915c80fba311954ca713ff231b6db5af72"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "66883ee552fa4b51b746b3c403916c1c816ddc8a1c87451c8efc248bc5908b6e"
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
