class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/merod_aarch64-apple-darwin.tar.gz"
    sha256 "332cba556539effe4f9cbec79df08639adf7a405a40c1a581d58aa704eec6d75"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd226d9256a517d3fb95900a53bad59f119014ff1b9553ee82e67a8a313c7d63"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.30/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a37ee6d32ae540a34441dd5af5b3b02eed181345a1f7548d30fafb1db2c2570d"
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
