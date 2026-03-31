class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/merod_aarch64-apple-darwin.tar.gz"
    sha256 "8ba0eaa145c771be55a00242cd452d3f20dbba99ee2c04d3a0bb414dd74a0908"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "47a2ff9819bf3c943ca1759976cdf063cb03275295d8385ed75be12b15bd696e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.15/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fee9ca90a21a15aaed48633903b53d9d27aeb15d5b123883310ba8ccbd9c0bf8"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
