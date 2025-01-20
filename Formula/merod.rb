class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.2.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4c759cbc0f9d9ad39c77d6eea474070772e340f7d1a627e4e9528f37ed0d14bb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.2.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "84fd81ffe75d527ac3b2fdecbd71aa3c4b72c73aceede6575702e76203bb3233"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.2.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "efcad05b85c55bae6fdefc5454f2e4afc02b7315984227b9cfa61bd403ee7252"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.2.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f156bbf177ccf6bc8e7cc50364fc1b163c7b1f4587f02743f6557c2f21f2eb4b"
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
