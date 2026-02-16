class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6136e41726f7a5859318c9a722cf56129d45f1f6534f2479e1074a32c2b228b5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df08455c142959ceabb31034050eb4d1d887a65c4bfa66fdae1b78edb97b0744"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.46/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6bf73d141b2714d335b7612abe92c218144bfd4eee257d63aeba85ae5329d9af"
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
