class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "fdd2a114adf09b913fb12029f46382378fe7aa6e2a2a176dc7144aced202bb91"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "8aef6bacfe59bef2990532e41f082ff54a0d541a03f38b89839377cfeadc1b00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8250351ab163b7720245f287b2f397ab0300d78ae3edcd38a604bcf23c25876e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f28e24f2dc4f4ce4beabf54c3ef6781bcc1e3ad45e917898a7084d52eed9f6b"
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
