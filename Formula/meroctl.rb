class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "105a9ba3e49ed4eefc30c2fcfb06909b1fff6373269dde853955d59460aee3e3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78ceeee5ec50f69067d3cfb1882149177cd14e60843a75d91c971ebb59d9e0f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.11/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "95aef2b5e0874e8b032423b4382a350b2d1cb64dce552e267ccfc9204f8e9885"
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
