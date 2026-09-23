class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4c36925821644bd416706f9cfbf68a61a156745de5689c2a33aa3d7a8bff9b2c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d49194e8ed6e6bf594a40bd9ac5dacfc0b86aebb8caba98521f88e64a8fed75a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "20f8415462b29e2aeae276dc1db4f25c689c2b3cf533e3b6c3eb950309ce9802"
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
