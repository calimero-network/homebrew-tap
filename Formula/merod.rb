class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c6e93b3b7dcdad85c4fe73dc011ec49dbda7b08c5e84669af4dbb51355200866"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "3abdcfce07c2975342ea8ed4308baf622a4568d58c877c06911d32c944b6c02a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5bbe72c09f46aee85669f9eb11faffdc5581bc0173d9d5d6e1fdd49cf0fc45b6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ac82a4ba94db032b9bacfaa3e18917504c1d374b9a7d86a3c8a40162768cd9e5"
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
