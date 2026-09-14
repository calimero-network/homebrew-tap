class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fd901effe83eb7dba86ad454eb8ec8fb68ed52951c01db1cb558718f80e49ecf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "46dc2aff1fa2f62f61b430c8ca2947e25b217530794698907ab34dd682a720da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.34/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44e69ee407b512d9f71776a7f429ec885ba38e2a97e05fb6c45796a87e0af389"
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
