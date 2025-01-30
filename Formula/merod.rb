class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.3.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "9e97e6ed4d1455b6b8bbaf57978ab2775f6160709965ed6ea3aacf441f768b4a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "f1d8059a8d3fd0ca5f85fb6b58c38626739de3208b54d08c493a96390e061340"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7d923d46e41b8c9ee1cdf345ce4db73016194eceebec45cd1c956e30aa27477e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/merod-0.3.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7a32bb537e42935b34c76b034d0185189a573df56bcdaffbab273b131fabaa72"
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
