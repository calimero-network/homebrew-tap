class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "19402e0bb749b027fea3453f7dcc75be10a498a3028e2a8294a74172e6e4bfb3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "adafe71f0502760dc1826fc8ba694eacd52e39596270c99abcad6d796dfe13d7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd011517b118bdd9c5363a03d8f23c4016446a99c6ff54244774e8cbc5a3e33c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f8edb03491180c2fe063150711b686ed2fa013499b43aa4260255ac5ef3b90ad"
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
