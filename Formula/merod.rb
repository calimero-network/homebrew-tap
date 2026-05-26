class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/merod_aarch64-apple-darwin.tar.gz"
    sha256 "762fcaa26ff7d78f01caeb6ef2364859d7d20110eeeb9d3aa6adeab05091a63e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9877a4e4065a51c2972b2b364b37489ecc7bb341e2bdfe01929c982bf4727cb8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.45/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d6a64ddafa33b3e1677e1ac6fbb52906a75ef999f9b2193c7b55b6fcb983a2f7"
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
