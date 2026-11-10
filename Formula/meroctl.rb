class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.15/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e2efa89ffb37cc9d0d1ebe722253ae17f13116f05f67cc81a49f7218c97d4bdf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.15/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "43c84ce0bff97424c8e2ad9978265eb85eefe1641bf9d35b0ab6b54c7f711f46"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.15/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0dd8a66f6e24f1204667f3d5d95af5cc709470b05e21752a1e97f079ec623e36"
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
