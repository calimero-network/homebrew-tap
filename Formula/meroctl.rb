class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "962f0d73bc3582068e2635630ef131b93a7c911943949f34eb7be96882860c32"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "cc029821603a037afffeda71bb36e44c1d470cd93b7f7be6845458c195475d2b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bef1fc1fdc3caa164697406c9e0b943dafa11315eedd74594e5a777cbb188191"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8776e29df618db4fc7e001ce5f700b4a6c3d8c554666bdab6f979ebaf7a7f48"
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
