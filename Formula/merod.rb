class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1807b4348cfbefcc874fd3c536e7b27d155eec8ef692a1c5835ee7f0d26b1e2f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "97ef50a758df78e99f1eb5dbdb89a196f8d959d1c05afcce13942b95d27fac98"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b56f3ea6c8c4bcb3fd82f19d82100950c2a9e9134aeb3052cd207c2bda9a2b0e"
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
