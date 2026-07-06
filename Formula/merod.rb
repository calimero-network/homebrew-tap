class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c5fec9c300b74658a0256ac97f1db46b48f876dd19d87248cdbdbd8ee04c2d01"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8aad70119a8f7f8b6251d0c740219ab1d86fca11c7f1297fe9e6a0354e5bf1f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a346d45e7b70ce830000a620564a39479588a93542a3539952daae352ff35af7"
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
