class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8ea0b1101b014be347bf48dc2ddb6f6d7af3a3bc6b7cb7a1cd19b44ba0d7e48b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "07fca5c9ea639fe0e6246d8a1afe9f171dc51f7be09734cd7f2487213d90fb1a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.31/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8910fab0ef4c79726fb1bae93706c5a719b2f4ac5796bad546f27ff12a14d160"
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
