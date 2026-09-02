class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/merod_aarch64-apple-darwin.tar.gz"
    sha256 "317c79b4bacd4bf53cabc210413095fcf0ece8fbfbc72e4bea2bf18313242532"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "016f6fc08a124a1c61f6929135dc57e0825ab79d97922642ab2324d315286a92"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1e1937d15beb94f0eab2d474536c2a152ef09567ccf82487f4d2d19168bb5c6b"
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
