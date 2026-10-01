class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.71"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/merod_aarch64-apple-darwin.tar.gz"
    sha256 "0ec44322a7664365287380278ec1ad228f8315ce0f16a2695e636646a28d8111"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9dcf806159571ea79f75dc7e4c2f482302f4e1814caebc84ecf82c2728b5a483"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.71/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fad60553b3caef4012863c4e144ff0eb2eab93c97785f72eb96fd2118836be0b"
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
