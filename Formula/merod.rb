class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.46"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/merod_aarch64-apple-darwin.tar.gz"
    sha256 "db175ecf327d0f9941f4516c3a10f18634e77fddbbb4b6e716d328b84bd3818e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.46"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e5a99b0bfc5d1462260461e9defbb7adeaa0b7b01036865cd7087ee7e88b9f0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.46/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bd5bcdc52e9a68a5da21de052bf1340810f8a4c32d9c901bd07f592c43bf0b9f"
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
