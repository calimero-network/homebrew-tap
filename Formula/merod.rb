class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/merod_aarch64-apple-darwin.tar.gz"
    sha256 "e1848e8063a30a5e796e6020bc4882be8eadede563f168e41d6157eb32fda6b9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53e4616b5c844187e5f77696bbb68229aa1b424f024d908deee403cae87974b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af6d4ebc551f126e2a2765ecb568a0f0dcf4ca5e7a9ff342ffbf5f37f97dff85"
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
