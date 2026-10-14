class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.86"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8f3726dab671e0936caa090c712022062ca7102d1800c74bed714419d0299b6a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7b19375b27b7245cdfe14e593898a84f5ea268fdb99e8d8c362481759161cd53"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.86/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "85677a7916a7d04a2838451b278e52ed4700d7e26e213a44d6b6c90efb14c18c"
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
