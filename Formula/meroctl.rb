class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "47f9919f93ec63beb178bad5adef88f82426b4201ef911888884be7726b1d460"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "93bd2157531eb588f82e0157059c3c7a8a90357c5ddffea622c147816231d460"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.10/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36f5be7495cced29e9b653ed04c56fc196430ce686b99a8fdd83e3ae94193697"
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
