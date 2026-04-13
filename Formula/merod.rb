class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1f79c9c2102e24caf30a0952e60ab701944e0a10e65dee6d25d80cc8ecd2b926"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a1f1ff3a23844b3fec0af46ed47139a8387c9e1f0d74b293126c1af2701579f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.24/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ec265fc297dca7829d81ba38a7938a2e2aaea004400766a43dc1e8c20d2db78"
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
