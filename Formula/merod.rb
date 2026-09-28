class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.60"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/merod_aarch64-apple-darwin.tar.gz"
    sha256 "09ec1eb9e9f464ecbc39bc479214f105a2a6127b4c927b36fa037c8d159b6ddd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2738c8269fa78a702007af3f8d1084b2d83c139e1d8b532a3ce8a46c416e49f5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.60/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1a674f2e20efe7a50ef476c8982272a1d68e3f249c2e5e919dc88039961808f"
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
