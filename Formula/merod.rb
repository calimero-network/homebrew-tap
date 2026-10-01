class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.70"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/merod_aarch64-apple-darwin.tar.gz"
    sha256 "02a3b2a19121c4dc2c8b48078461732a7ea954d1e1b3f6ceb60a905af317390a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4aa0b3a29f6fc32a67d4e9e959246837d3e9a44b4c504ac22c5c7d48fe8171d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a468e751731ed13dcdbf3a07d64361aad537fe722ab93a88154141e14faf3828"
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
