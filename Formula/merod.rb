class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "76f0e956bcac26739e92811d8e38363113b99dc5420233ea7e45c96b09de8c6c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "5aa36ac8c704562df971290d742f7609689201c3bef8a6b03b85b7ff4fe01e83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5bf99b5faf40b57c9a533fe30faf73d901d5a3e48ae2f80ddfb3fd5330d8fb18"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a3c9d5aa9ed5238231c3c9b3ba803c0a74a5fac447e40985c591d458cf8f259d"
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
