class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "cb82f0dc382999dbaf05dddf01c43a89b37f1af06e67187bb64c16074ab48ba4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6651270c5c4f3e5990a4208a95bfdb63482be57ac1033b82b769509521849852"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d63c220cd679409056355163ee5f0deee8334ac23cb56ec932502886609163ef"
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
