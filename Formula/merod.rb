class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1759860d19bad148737bb19d15cdf08ab091e4b6de58c3fa6323ba1de77d7a32"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0815272e3e9bc8097c8d94651a7ad4af0200b4c41739300437999f9a078d01e5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8dc6231fec95038cc5fde4beeee1c3a96b158a57835bcae67f1b32ac97679731"
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
