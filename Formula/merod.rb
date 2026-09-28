class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.58"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/merod_aarch64-apple-darwin.tar.gz"
    sha256 "70d214adc24757a184c7eb008470a3ce92b17232f0734ca40be9c3dbe93c327a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "158ce7b496fbf08f19991fb68006d1eca243466b8d8c88b9b3ce0296de5ee51c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.58/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1bf31fefe6fb0df1a15c6a36703f924cea52dc5e795535e5e5da3fa8beaadb3a"
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
