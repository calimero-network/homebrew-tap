class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "bee0d937140d0ddfb087c1352117d11283618e63c50b35c965de23b1ad4804e8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e6c50e3db7125276a6f10d17a2ef85c84a8b2cdfc06231ecd7163e5ebef1f68e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.42/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f8f49e24647728e394ad879898abadcf8825cf7e9ba6875dcba5cd2eba7b257"
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
