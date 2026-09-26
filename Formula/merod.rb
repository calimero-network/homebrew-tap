class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/merod_aarch64-apple-darwin.tar.gz"
    sha256 "b6615253ed5e50e412211c04b060cacb274f05efbc3527f81190b375c61e14ee"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b386876e61e78baacbdcd4e43a3a70b24ce192123fba813847cb71448ba07868"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.46/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "224a80b27f86bd803ad47d30162246cab12973d7ad2c9a2d51fb95a0347c9811"
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
