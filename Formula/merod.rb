class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/merod_aarch64-apple-darwin.tar.gz"
    sha256 "efead3654526e10f6980493fa3e9b29f597670931dfd632c7a02897b0ba80fda"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "16350bc7a51fcf34f30a0116861d2b72bfea9118b679e7d448311f27da17c636"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.29/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "208d769482584d1b9a629b934ebba6707017aaacd8931e21c0a66fc8579731e4"
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
