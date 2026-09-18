class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7c1bf2bc1d0523f9031311f959fe08f8a07de0abb36678922fc450f86e619a99"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fb1e6260a973bd670c58ac4931fa948ce42ff13677a2a271a3cdbdcbe9fd2172"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.40/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1926b5424b862d488b2929af6cb27c6307174c5a238f0d1395f5232c2ff3690"
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
