class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f14186ea380dd7c91e342c5ad4f9a9ad18244da30a25d444095c1d5a3b4257d6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "4009ab22bcfd3a7741c06adf3543740a9674e7b388bd9a9218ba43320241dd38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3acc2bb399095b570875d8006ce92243cb52c44cea5369a9e06688c24b2d7144"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.5/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce0a399b2eb57914f2872f8c122890f800fcc70199d1f1ff8cb4ffc023736943"
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
