class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4b4973e950d9d771c9c985e77465a6d7cc795d478f52ef5096dda9d8aa3bf14c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f82d84d3c76df769fb8b08dda0ecaf5eec27c08b80c21065cf7ddc2cbb5224b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "529c26cf5b9e57c9230a11acc8ed46804a6ce3c169e5e85e92cf7014255c1c69"
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
