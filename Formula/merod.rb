class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "19f0ea7316a6b7ca708db2723b0401a5e5ba4663f099991d3a102ca377b7eaf8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "59655fa900416d84c522783081210f4d1d18a6caee2737fa26a252235af344e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d71164aa84c4bed1c0eac1392cbb504f96863681fa5eb4bd6312376c96a4ad34"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2a5efffcfa6bfe7389b76dfe9671ef7fb2894008889c9cf2b4f21f5352b17046"
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
