class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.79"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/merod_aarch64-apple-darwin.tar.gz"
    sha256 "41fcb4eed20774de15e2eab6a31e18ab97f743a938b09d1a8d561b4ed946d08a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1a6519e4bb8c927f4c5fcc05dbfcc2cc835f8e0ab0b88fa4166f332231c69d4c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fb7611d02d9139a6d262cdb0f7e42cdd8542e232edd4e67e7416ebcd9068787f"
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
