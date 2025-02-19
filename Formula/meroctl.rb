class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4ceae2f0a9e605e288085baeddf10ec87b8fc55cc8438fa53a93fef25ad3641a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "79f618128fe88932899b621df5b7f9a0d7ebb5ada601794f2ee8331d070c32c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2472cbadc1274365621dba1fca5d2976deabd0f4665e8761dcc5ff961a00d0aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4ec5f67846916abf0e1e3f012b0b96d4cfcec109813840db22daf39f1238e439"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
