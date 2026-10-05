class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.81"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c56a1553cbab0fd3641bfe39933b8b33d057a7978d2a4100998e5a311eb16acb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.81"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "81e3179ab1427824c4d3bce2ae22fe35ae02215923da863a973b09d4e52b7a4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.81/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb0482b89631c6ae5581a26c039b16aa08411682a41f811036f214ebce78cf0a"
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
