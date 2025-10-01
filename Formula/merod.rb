class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/merod_aarch64-apple-darwin.tar.gz"
    sha256 "994a10a4b45ffe8ba944a0907a7a29db1637dcf4e2c9d0fa313198ee0c6a8754"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/merod_x86_64-apple-darwin.tar.gz"
    sha256 "faf13c640669f1e7f5c37e3daab8f0b000f08d3d524a9a908cbc77963bcd32e9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6f7c94846912bf7c2f7df9f85e7c040d1b6fd67f4c23c9f0693e55c61daec4c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.15/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55f7b427b372a986dc53e5efa19ae3557ab928aedd98f52aa1e9890e0cf3e4d5"
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
