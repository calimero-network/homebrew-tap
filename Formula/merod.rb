class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/merod_aarch64-apple-darwin.tar.gz"
    sha256 "cf89972a069cb81f8f5a46951df07508c41561c32b1cd0503d04daae343a15c5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5cda2ed468363d0c4fff7fe8bfe2d6dda710af85cd86d91b4bdd7f75d712500d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.14/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1f1aaf92243154645cd0a03db9b14a6f92d61bc6269156ca1b6e663ebd398f3"
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
