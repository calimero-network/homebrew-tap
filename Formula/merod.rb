class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/merod_aarch64-apple-darwin.tar.gz"
    sha256 "f8b74f397bd291a32bcfa663ef6e5de3aa13213ac3e88d55dacf3aae3114e95c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ec42ac15cb867df09d40eb6fd2b77d43df13fc0a0a9a4778a85d9ef2111f8972"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f9b24da1aae7bc18f95657713f0894c7fdbadc441fb0669c17b31e380a4756ab"
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
