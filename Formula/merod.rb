class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3474d5e1c57255b751df4c0fe0059207dbf4382e1a8eb0f70e00625834a66541"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "e99ebf3707efb98024eb6c0420e474ac383074acd0ec2b7c0a8e23155001c7c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "25864a8f62973b56eb0d817d7643926b43c0074e632c49e50ae0d9278d743c75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "76e985fdcf0ec2baf00c6afacde8ddbdad5ef5839e293ca6062a2269a5a5c540"
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
