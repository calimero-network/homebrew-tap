class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5298b32f70fd244347dafc8c3a232e43083545431d62d248abf71592ae41c044"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "9e2f1dc5ae064528c2251bb6233ba3774b758661eea0ea923951568a4d492586"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4cb47ff57771d6b12512ac3902fa78355d3060d5f74e3f213b1319621b174289"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.7.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0de784aa8fedd5a6d73843683e89f38cba6d4c6ceefab9ab8665e530b984a8ae"
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
