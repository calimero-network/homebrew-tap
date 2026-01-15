class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1f2cfde9a1e333a4ed320a6fd71febfce5c632c96c6ce940d7c04a7375ce3bf4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dea92cd36ff9c278d15f384fca63c246dcad5d66691f0aa30f885cbb0a631f8f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.35/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bdad1cecaddf908a5f1ce76e5d87f85c5f25fcdf23c179a7e6ab6eb2221c7716"
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
