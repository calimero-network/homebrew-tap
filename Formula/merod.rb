class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6a196dc08a9004dd441932d65286c81fd30fb8de8f2c2bd09d9bfb95eef60ebd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "658a19e53cc9a2815cd76ca6aadfa4c0aa24ad145ff79898830a8ef677548238"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5526bdcbec51f5dc729c510e3e31f6573590db6c200cd28b2f375d4eb638875e"
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
