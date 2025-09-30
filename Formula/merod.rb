class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6f73d5b5c6265f1e62e627672e8a2389e696bbab700711854197aec92f582d41"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0e8179ba90cf982a280f2baabfbe32d8cdacef652634ce5ef57759a8804e6d06"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "43cbc894688233e6297e86244da300d758b026b351b4cf35a8900fe638b56f44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c7b06ca46a1a789483ece25ca68865e5feab59f4ff041ed234426483968c2c72"
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
