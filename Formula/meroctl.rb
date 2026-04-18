class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "85a2364df99ba75f78cd6cb44a862a1e6b82b7711b214f20b7e268f408f59261"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2a8b0f41243e59e85bb1327f765a41bca481ce32e5c649a9267abec307a94e60"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2de090b2bdeca883979809345dd274ca0270c8c9a64bd01a1c7410dfa404d5b6"
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
