class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3a17de03a5cb22a8fb2b041f194b9019be55e960723e33433c341df116a1a077"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e6f37f85cb9c478109f8f79e18913406bf1477e63a15e31ba86dd60dc3e3725"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.27/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ff0ae7261fd4ff8e99dcfbc88a5eb1175f91a426b5866e6dad9c4ffd3148c23"
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
