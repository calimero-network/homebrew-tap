class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.69"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c7e4de25176ad8b5594cbde0c527b7d304f6b9cbc0c523e83ee6ae3ca3b5d66f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5430c38166b856efb14f6b10f9094e7d8ef2dba956abc52bc4084b11de2d7b3a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fecc1969ef5322d79f60f93daea8854501db61d8c4c91a052f45290372c18849"
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
