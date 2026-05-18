class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "cab6e2396dbc66c73a0128789bbebd2e9708d0efc1d1a3f0ef047dbcbabf82e7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "35bb66dc760ef34e41eb78a595e965e31b56df6d9e41c03d814fbc91fabaf061"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2917f47ded7499c9855b4e975cdad367661fb55abff80ada3cfadfd008e52204"
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
