class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d016d456779116f7a3e50ed42563ac24ff1a6ad451404f2b36fe007f1522d623"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "34123c5959ba220378d60ebf48cb54664dcadeeab5269f08900cbec25715d047"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "255d7ad4e96cb24d9a844d903c8da0d4434d3f16fdee9bbcd08a77289ec7e741"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "721e93875a34a04f685c53da8a5867fe29d46160509df9c1e309118a8f0f6f80"
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
