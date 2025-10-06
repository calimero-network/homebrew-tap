class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/merod_aarch64-apple-darwin.tar.gz"
    sha256 "442242a65f29ac45d506a9264da249b9ecc7e8eae59a49c85461f22231120d4f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/merod_x86_64-apple-darwin.tar.gz"
    sha256 "44cd128e207cccff9c77fb9bc5b15ce11920766764e74af5adb5a6e7244c301d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5cf19487660d2f3ac599bd42713a79e6e9890bc35ce91206a7563515067466d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f8fd8c070856c6bf4c801e4621b56fae0d2f13ede78cd422de171a77360eab47"
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
