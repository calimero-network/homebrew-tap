class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/merod_aarch64-apple-darwin.tar.gz"
    sha256 "f02b3552011b733947017c3c738ca2516d2b7fdd3ac522e5ebf38934645a65bb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "90e6fecaf5b61536089074ce41b650d740eeaf75d7a262b591d9bedfc95a4eb5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.4/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae2057b066478ebd495d0a69fdb346ddf0f00e1a7aa3970900ef20a3d37f2713"
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
