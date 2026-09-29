class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.61"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "58c339a3b9dab6a1feb2cc8c2709e5e1002186643b2c3c287dd25495e2dc61e0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.61"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c44b504382f59f894c710c6dfa86a1f8a13eb61c6da600d7c1634252c7b2df1d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.61/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3c52f1ab1cea19a75f992d53b6deed3c6eee79739f9ec6d58c2ededbf7878e3"
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
