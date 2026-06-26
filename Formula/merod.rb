class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a3e2bedbbd2709ee35f57c806240ef7f488fb8d20211fb64b6285d09f3ed4c8a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8510fe114b3a26eb5dd86fbe7f334e74ccf07c3f9ec7c0823391de62ca3e2ea1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.8/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8fd49f216addd69cceeb035c81ec9f3c6e1ece8972e61cad5feb5bba1a96b32"
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
