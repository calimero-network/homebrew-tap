class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.82"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/merod_aarch64-apple-darwin.tar.gz"
    sha256 "29283f3def392e4e6d24f37f6d55ae07c365803d43cf9043df5d351df768ac2d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "91da4cbc6a06956cff48dd95763f3385d0cab92e18f0785656cbc0fc18ee2490"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "adfbe5c7631717dd5294b6c06de5df1456960d92b16333abfaf5a9e922b6d302"
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
