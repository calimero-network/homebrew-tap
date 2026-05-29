class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4e79f81f313acbce17396fa1e4aaa386560eeed17d3b204439012862c96c8b4e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8c2798ff16e6333e75eebf53a0d20c6e59acd09211e839e2a18adc1726461323"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.47/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cfe0fe521a19aec16304d65973e6ff0c3a01e5c897eab11c93ebb506050c1601"
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
