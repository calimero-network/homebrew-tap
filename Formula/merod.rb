class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/merod_aarch64-apple-darwin.tar.gz"
    sha256 "36e386701527a6bac19044818449f731924ad37d29b3b5879523aedba889f374"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/merod_x86_64-apple-darwin.tar.gz"
    sha256 "31282114598d97e6878e9dd60747551d88f074da10645386f57f6b17f9ede628"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cf53056550dd1459a23f975effa13bed5a657d7a6ef7e5d8c08fe466646c9bea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.9/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8a5802d264d4d33431c9ce85d2d846cbbbde3fb48de88c50846e16b76a2e9682"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
