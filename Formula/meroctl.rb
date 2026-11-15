class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3ba016a0ea3b1f9e09dfeb538d5c80ec7dda9fa105db4aff6f69d99f2d07736d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.26 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "328c340ad987b6c6f57e2ad625ce43f969fd1bcfd0c6f3ccc46540c44284f78a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.26/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "734a076e1886324c1cf8a5f5f8182cbc6116062659f09110d5a740be1f0ef87e"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
