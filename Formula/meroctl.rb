class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3383093bf17c3c62428db391aa1f321e16cb8ed6b982a359de79a5a4f655a186"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4b75d6e955562b6f2047e19570c037dd2c9efa309f24bb0aecea2d3cf347666d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ded88b3f05ca328c607da5cc336ddd43455064149e3bb3a6edd82a610d45c622"
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
