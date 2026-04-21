class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7ec106c0b58e6457f9ad1c855150727f50c9543c8daef50194bbaf23b4b39ee7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "155d020df711dfb8487be9aca9ec96474cbd7fdc930c7915d12b530da8a5f8d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.28/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88c7d68eca5ea3b21bd53216014085999d787aee042956fbed802159edd04a60"
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
