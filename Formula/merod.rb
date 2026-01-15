class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/merod_aarch64-apple-darwin.tar.gz"
    sha256 "802d0894e8e82734e9937ad3a64ccbba0d979384b2f3212f7ea06e8184c1f7bd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c9d37a926c4b82699da92f1e96445d5fd1a310be6eaaf53977c5ec2e61d3749a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a88b4532b18f25492e9372e4b52da2d7f4ded67860e764b239c5a109dce0d593"
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
