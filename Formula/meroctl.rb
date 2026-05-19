class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "40c5bcd5cec16fe2d9cc7561992d0689e27abe03f281fda1e9709bd7b38c7882"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "73379cc134b10b48fcc3f86bb6866ef3d598bad2b7825a1a212c2ee7fd312d38"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9155bb9621c38af8395c03fd9fad3f3d82eb5425fba0f9263a500dbea7eddae8"
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
