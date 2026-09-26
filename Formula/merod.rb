class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/merod_aarch64-apple-darwin.tar.gz"
    sha256 "06881c07fd6ac7710cb778516d185cbc3afd9416e4a113ea76d4c9f8977bbf62"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "135c90bd6f1423e4423a4cf9a2f389192d88d82e3ea13b5c48003913bab4c00e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.45/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3ccfd19f335f2a46c10240184311dd57a72b63bc224795986fa2d74373b7f121"
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
