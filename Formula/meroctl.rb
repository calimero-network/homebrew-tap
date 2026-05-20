class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "14749215bf71b0597a7e18a740877cee286c9c16348e6dcac5119adbb4d98046"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "979c0688d1e295a3c34c8f3b380b22f7172a9bbf0e00b0a2408bb0b5d7c65657"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "012cd56f7996c26333c7c11f39616517b20e69d841802221543237dab2b0484c"
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
