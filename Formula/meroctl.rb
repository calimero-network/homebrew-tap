class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "9f1d5bc8e9ca3bea2cadbd13c6fa128899aa6d001c064010a7a55dead512d02f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cd2669b2d8f55e61acda50aa608895d4e2c70c3529f5a9350903e32a21ec35a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "120a4706aff134b58465e4a5f0f9ad9bc011d52f5b1f95e61fa9de2dcdfb0f39"
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
