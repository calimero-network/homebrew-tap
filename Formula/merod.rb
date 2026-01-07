class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/merod_aarch64-apple-darwin.tar.gz"
    sha256 "54e989dfe07b47f9dd1eb0a9ee4b7e32de810de14e2e86633353672abd492142"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "45e0c0e05ca82f290e6970becf3546c6fd4b093ab015448e6d052c58ba40ab7b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f9fcf17116bfc557b501ecf02053dcaed229be78a9cf5e4c9525897b79b15402"
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
