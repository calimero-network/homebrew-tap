class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "76f676604b76be98c0033d7bbdc883de35e684305c9bdfa249b987a79e85a0af"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8906a449dc0f4a0a0e2bde6d7cfd7eace018097820ea0f77aef1f240da3c4867"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f387a4e2462dceab706e0b1c31657bf33c22d94622acff9db45552a68a31a0a8"
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
