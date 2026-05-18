class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/merod_aarch64-apple-darwin.tar.gz"
    sha256 "30a31f7d92c114e01adae797ae005b11bff249b8424532f3956cadef99a63c3b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "93730dd509cb473e84ee8041aa40690aecf429d31a3c4ff4b497a782bbae0c9c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.39/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3e5ae869cfceb25e950cadfccbdf4aba622c49f6af11bed6b1ccc042164a6a0"
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
