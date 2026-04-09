class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "144b8206bac32ecbd56bf559fb973db3275224fe8ac56144257706c6545109d1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3eb8119d176d0b0688d731763a8680e09ea9134ba0ac01b181dd68a4fcd10e7a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "021048cd1527c2fe597472187433949b22a5952f56e55563697a93ed76644f3e"
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
