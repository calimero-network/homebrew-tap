class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "69f39e410d84140c8d3f003f1eebfdf81587ba09b38047929c0bb3b092f946fa"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "9997bd0db25d5e652700f07502c18c55d344e6694c2e9aff58035b20524c4f3c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1e3e0dc51b4b5047529dba30d74104f6259435b1b5e31771bb875a8726c30eb7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "873275d0310b3bb597f3468ec2e2e48e194fd3cb410afebbc39314ddea42f740"
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
