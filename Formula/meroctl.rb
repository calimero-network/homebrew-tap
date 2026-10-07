class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.83"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e6715a903cbb569b505c800a1586efaafe7daf9ec02ee8bfe725ad005e61f01f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd130e5073732e25ffdf17135c683ba181b2b2302f8f12df268437dd9090fc44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.83/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba30d864cc030b1a7279797581e127c9657f92712588cb6846fe1a37b91b8148"
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
