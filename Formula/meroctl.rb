class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4534e2191ed63af8964f6947620dd6f58b191acff92b05e1984dc73a29a9bbca"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53ac23bffbcf99027d704f0a47f78537164cc7ecc8590d0648e1f73088170e6c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe03b85ac8dfe2b849d0b2a6f8640ea57b889d48c888de741b39615294f0c0e5"
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
