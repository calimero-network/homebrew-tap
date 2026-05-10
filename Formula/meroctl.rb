class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "5e8382b1a5e8ef18860fdfb3471d906155e5fd8613d7305b8dd74ce2420fbaf1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "413cdcbd138b3778b4477a1d136781eeee61343faba434a7f5b35c92b2091902"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36c1e1d316758ca909fff0012d0d5a405f91f6418a982495c8055b343a34d063"
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
