class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "93b26278f817c0bc87bf192f77a34a02f8a429133d62263e156953377f83a6e6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b91840bf00dcc2471c4d37c1810e8a9ead4b267d276c19cddd727fbec7a92790"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3129bb083a30ed8a64f61e0366e8e4acb372f7131a95382e4ab1a3d1241703e6"
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
