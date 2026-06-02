class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "26fa60010bc4f3a4adaaa04535394f9e278b0c09e2ae043f489ca1a3c96a8dc2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b0700b374241573d79c43e2b30eab3d9f3c0feaf999b1195dd968c88667ad4f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9867c0a1bca5e18cb8090a429f9c8528d368370aba8a48cac3f88534cc278ad6"
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
