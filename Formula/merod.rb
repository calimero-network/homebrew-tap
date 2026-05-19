class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.40"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/merod_aarch64-apple-darwin.tar.gz"
    sha256 "51aa3b7dc09e47c1b3b2f2d5037d0e07ae690cf0b40b0c2842e565c64b652af6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6f630e3b7e37235ead553c7c4a1d9ac26da00551c4741e2c6cc20f7e1e53f158"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.40/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f682f1ce21d8689f8f67b1992826ad9eeb7a5e18229c5944a4793cf306259176"
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
