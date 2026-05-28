class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "45a18bd810cbe8b38f2ae752a6fd8c3a7be9d34430a8c6a21b3394a4887c9a7c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c9d309b01c12f67965308a005e0836869a55b6fcc89db04b0a2ff26065969b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b237239ae29c3cfd9e7045f5202037b2a2e650414765f41c3d02a4254146a739"
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
