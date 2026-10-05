class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.80"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b92868ee8f84ecd0727a9138ba5a1e7c69b952319d0b72fe75ae4f7a3414c482"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b4194fb3f9788740dbeb46b6372dee8b42a2b657a5a006325397ff736d1e0555"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.80/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "86ae826b10eaedacae40bd6b372b758333eca8ec49e7ba97287bb9eac62e1bd0"
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
