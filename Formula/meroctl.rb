class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.20"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "fd00879ca7596180854e88b694e7e00d5ea4a91f835ede7c4638ad1a030dba71"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "89762f9bbd4076b0ae7fda350ac7981ed784aaad0c283c6a5f9dda7edb73995e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.20/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "012c000dd3ca94883c0f7afff367311f435a43fa9310661760d33ce04d22f592"
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
