class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a77851cec43743ad4c59b736cad820e911fe4531e701c4c3fd5e8d397cc59c9e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d14d9858b837d92296d4a1b1dd065036478a868fd3167a4c15a1ce3a6ea48f68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69f06989c476af63b12bd029c2469952611266dc722a3b67af34606ef6aee004"
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
