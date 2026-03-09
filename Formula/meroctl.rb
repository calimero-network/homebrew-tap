class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "2e3aec1cb66d5a048578158f31c4fffa65aca3b96aa1d6e55579aefdc3a0d674"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "66092de44ec32d74c6bd8c0410012e9878b6ac28f4d16b01fd051f70a1119878"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "765e7083a008b704d4a38dd87fd826b2321be6963ac184e627de5bdac595980c"
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
