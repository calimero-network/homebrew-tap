class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "7bb8e6349e2821e5ef06b41b44f9556210085152cfbe49a1de9103802031d90d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ea9288181aff7654c0afe4f5cae0828b044700956328ae423179c1dcb5f5ac54"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "017650c4eb3d715e305d40d9c227e3778e556ff7b5d009fc0044e22976734246"
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
