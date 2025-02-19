class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "20be465ac2836ba113b668be16f48896b23636c58fc6f23cac47ca8b277703c8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "7302454deea476132cb38c66162fefff3fd42a7881f448d4f6dae7121dd0a269"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "62b650d6c7b254967b869a27d9189e60277517b60338743120c7959fb2241cf1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.4.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7334c5e44a8d66914f3ae1d90b025d4f424c09ad4e88cd60246892c59c1e1133"
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
