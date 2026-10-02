class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.74"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "bdb2035ae6d154877b4621038c11ebe2dfa3bda22279105f63cab12c68733ff6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9e5c3bc6f104ee7d132adc3ce25d656aa606cfaa793264522332d74d35f3c5a4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f608c192b3b412844243e6abbb92ff768346a0fbaac99111155c243b7497f689"
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
