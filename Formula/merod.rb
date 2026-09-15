class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7373ffe55ef0937f64193bdf11757a901e22bfda26b54da6daac67f3f217b167"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d3c106f02301d85d8757fc850df8d8efa64f54af34c3c7726853893e4101ea7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.37/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bbff8b29f53baf01bdbf2703207442e3651baf504ed200244869627557fc093a"
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
