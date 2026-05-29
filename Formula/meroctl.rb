class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "db4f93bb851b6d6029584cdae9b084db8d65d1338a265980fcb0ec5e04007136"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "91e1b0d6545f65109bc4389d5aa38e91f6fdbc248da029fdfd87e6adfef42cf8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "339e1da67c4702ca2dbe62dde0ea5dd8161f97c69d2fd938314ba3f6e72d16b2"
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
