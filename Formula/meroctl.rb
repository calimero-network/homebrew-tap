class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1bfc2c35b0b2af70051d98622a168c5ce4761243328afcace36e2cb9bed0c9ef"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f167fbe9495badc9972cfb17dfed7b5d38a725c595c74690ed8649cc5aa5b4c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.22/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa22501055c02b313d1396a8e1712f05d4a3ad439ee51f69f8e7eb356f82e031"
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
