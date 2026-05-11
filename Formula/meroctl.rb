class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b979c4ea09b461aa81ea49fc3b76bc99eb34e986ab30201410759ba9bae3d1e7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "845b94e4af839140fd2dd94997c9c7c8f7bfb4955f09346e5536a4cbf29c2a73"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "34b10b9802fd13e041c1d98c3c9998248ecb9bb10a30995f17dda96955494e59"
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
