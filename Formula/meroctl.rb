class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "66edab9b7c6f9711c733c13f2fdb3d22aede9123a78531387b2a8e96c73c73af"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "b074cca480caec7371601e934758ee480d8e605092ec356eb8424e95fe9c87aa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c466fdeefcf01bb73cadb7ee11bfa26f5b75db8057c9ac16ceb79207ca45ef50"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ee013fcb58ed2a010648230817de8edefb4524a5d7092e528cc5a260ae91a910"
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
