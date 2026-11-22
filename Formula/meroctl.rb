class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "aeec98794556c433af607f00c1e6e69a90c92bea9f6ecb8ceb5ce06aeeab8abc"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.34 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "49bbd61a38969e6f77491d13777370d6729bbdd6a775b339969bd8f16d0e926d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.34/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "48e9ba9dac2f28640624a0c654b19941479eb5f2d632a59e6ffecd52ef302902"
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
