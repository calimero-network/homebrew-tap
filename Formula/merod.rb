class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/merod_aarch64-apple-darwin.tar.gz"
    sha256 "0d96c0353a1edce1c4892d5a5b2df9398de06784241ba3f71a288f72c447ff04"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "95b6ab8f66f172b9b4e22589e0ebda31e82b96855533676bb1581623c45b688b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd2bd859aab15cfc1053685ff8c8bc18b235aa5a75cae33c85c0a23ed36cb902"
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
