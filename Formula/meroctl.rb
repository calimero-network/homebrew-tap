class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.73"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 ""
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "648762cb32b9658aa4a6396ed5cc3c17a0e3b25b1f7c4c74275440a68e066bab"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.73/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "46f48e9c57bb08ef52b38fc52c49ec515085c1247a9e8108546658a463a2ef23"
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
