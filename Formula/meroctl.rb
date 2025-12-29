class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d4947e2b8a48e5f5b963eeb2330a021e0e36a73fc60ef762e5bc11bb641820ec"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "27309faa64c0fd0160c5629cdb59d5d89b7c2657b174d798703e7e19f3f20414"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4929681425fec1b0bf991e91cba997e1db0803c2119060eea17cc0fd750610a"
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
