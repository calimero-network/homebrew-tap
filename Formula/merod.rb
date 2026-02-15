class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3c2598aecf1114409b02c07e2cf0d68460a69ea850c47da9e9050867a6d8c0d3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "54c9f37cfc17642cd4b63853bacee7de890be99fa46bba76ff1ec925eccc72a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5e4d33dc6e6bee33364fe48ba73cf1be7df9fa6bb03a6990d8df4580a7848de"
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
