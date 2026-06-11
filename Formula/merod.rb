class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/merod_aarch64-apple-darwin.tar.gz"
    sha256 "85b736a59f8b03ee41329603af572f3c96b9680ed42644063cfac34228d67719"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "463056f350887768bd01dd33a07327a6888be12325494f4d13ae61394e29cce4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "21580e2ec5130904dfeb2d3e57b4ee804ab664f4a40edc57b1f4ccbc4f671799"
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
