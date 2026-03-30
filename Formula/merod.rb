class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/merod_aarch64-apple-darwin.tar.gz"
    sha256 "bfe8a24daee4ec390ff9b0bd5cbf165c7c2b809bfb72491291b48d4d0fdc6bf1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d512fc9c15fcea6f7b09f279b10284908cf034bcc99aa6bd7a8f68a72d90aa94"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11f6e0ff923af021eb393bf20621bdb27cb8ea6878a1079c38f6ab9067179430"
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
