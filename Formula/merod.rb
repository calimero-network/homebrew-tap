class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/merod_aarch64-apple-darwin.tar.gz"
    sha256 "35dcaf4d991211021a7a8d701b8e9d4c3a7b12be14938f49e48521b9c75f10c4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/merod_x86_64-apple-darwin.tar.gz"
    sha256 "594770fd760f4a9adf4769c563fc4bbf0b6056273a520defcfd5dcb430e8fa5d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8a3a4b06b695883d11ed004b97ebb749a48833508ce304804f0bf9f3374f7f1d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c29dc005733a0e57727e930ad55d9c5515a93044dcc30f7fe27a440ea5e341b"
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
