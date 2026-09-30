class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.66"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "759d48a5f7340273cc35dd2f5cc30d2aa8614690f67d66048411e0bd8856e15f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ad91bc8b9935c2f8876a29a7c19ed55c9b1b5b0bca2c05b79d2625cd8007e70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "06415fd7303047bdb6d27535c48fb77c90df3b175c4adb9482fd8c166fce2c2c"
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
