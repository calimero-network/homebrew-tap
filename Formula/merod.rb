class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3e128994b970ec223d98cbcc4796fcd5b4e97ca89a525b146ae174ce67fa10ae"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "13bad9fc432421adf8021380cf5560e2ad98be75e8e49326c3dd6769c98cd3ba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.44/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "01c1929f3f69fe2661afbd5a382d2827be4f06f4798f18e5c3c23df2312f67d1"
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
