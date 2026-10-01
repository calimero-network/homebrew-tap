class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.68"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "50c639889c75912115e9858241bb4a6872710854fbadd4c4e10501419cb2846d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "67092486351630e7cbe2b022e7cc175a15f3d6b55d7ed0d641ff8c9f0e7cfc39"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.68/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af15b1b5b528e48bd0b873755cc741c9c2737beec37c3b449ddf27ba5de8e561"
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
