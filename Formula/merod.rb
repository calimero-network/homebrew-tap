class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c58235d521448a7bd1b23ee2a1a9ec46bb6d6f25c8bf813e0cea4a866c9a2586"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c2846873be71d76bdc6e0a33ef902855234effdf496a9e6bdab3263cfab8b837"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a024d506b51f2c42fcd71b7c15ebfcfcdd05c9e7f78fdb2d0c870e6290bf527c"
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
