class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c3d73812897fc709ec70d31c5fc1c108adb43ae5b5ef816be526b498a25a4bbd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4539c22be973e1e476ab99061d9f80d1e30bf1f0ea4f3c30ad5318886ae38497"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b82d481f8f83b332cdf69025bf71315b88330127a140d7a8fe083e74090c3bd7"
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
