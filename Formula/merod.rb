class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5a0dcc4437c7c76e75c4900445b7fd79d273d512c6e8c5cc23423aa7cbec7d6d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17422e88c4c2d136b19c43c761bf47f09a50858e4a9cf30d0e4e2ba3a09db7da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9491858fb8005cb252febaf00e6d09d22fcf22e83f053f1c1a07f303ec7e8e6"
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
