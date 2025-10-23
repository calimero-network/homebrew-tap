class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "85d67514c8b4be803a2a1672df8f8e0a1c2d206e79cf001b3d4542933ba78499"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "96cd54ca2d1f967aa35d8a5aadc68400ba544a8a61d2d06f2e212ffb28672a0e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "11223fe2df9095949df45bb014b028bde85f0374bfd4f3fa9ac59d095dbdbe64"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "29c50462f8337b643bcf0b63974f7a1c09dcc503c73a0c20a4006f8cb6d67d61"
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
