class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "04dc18f44072f812ccb374b7a0c1f71cca3d493cd3d066a5d166b80f20137492"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3c6cb3f7b40b607088d681785ed744988d95369387348b944065b3dc5f1a5d2e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "57eea10afb14efa63d48e50107d7914dc12b47765f1184cc3db84ae360d6b885"
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
