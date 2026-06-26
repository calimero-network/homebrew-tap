class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4e06ddf3e65e1eae5c25cf29da4a8c4a46471a256b0c185873fc74c6f0313326"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d840a549c702c55040f6068d10a139daf11d0707e07217199075bfc72a912d9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3bd4f7ab002fad34de3670a03d962e2e1b480dc2e656133ac3630623fb0620c2"
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
