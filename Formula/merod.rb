class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a492134306bde63612b56317b74f28038a5a9bf58b47b60b21966d7f4a8c74d4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "07383bf2d6558127a61c1d3aa073407006aaac8e20e2dad84964c1f89b5c7874"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.52/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db73e50d6a7433a55877b891ecbba749915209f1efb18d132cd7deb23e6ba453"
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
