class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/merod_aarch64-apple-darwin.tar.gz"
    sha256 "20bdc8b6e847f2c5be4364a06bc408c83969b23742e7e0b4203d7bdb3637c9e2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1dd672868aaf47180e694e9c752746110bd9c0860b8ac86b4ff7da3f263de684"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3edd5eaab076bf13e23e5446ba43b34a3982004dcb0f53a2bfeeecd296444b67"
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
