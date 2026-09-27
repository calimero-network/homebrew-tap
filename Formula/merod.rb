class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.53"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/merod_aarch64-apple-darwin.tar.gz"
    sha256 "8cac9c7fdf663403f2f8cf4409ce8cb8179ce3e7b1268fd40b5409d46815e659"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.53"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c4aa8697914e1b439d7d0d58cb07f366150548df4d733eb13ac4045584c98b57"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.53/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4cf3aa6e5f2f5716fc0864308aff0cfe1f5a183611d4f16e6243e1dccab12286"
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
