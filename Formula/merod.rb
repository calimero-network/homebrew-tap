class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/merod_aarch64-apple-darwin.tar.gz"
    sha256 "00dea44092c6c2b315e5134c9fdf210eb2fbcf41b02ae8c793358adb743186eb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.27 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f4779180c97c73bd89c9f239410b1f81120eee01197238b3a1da974878289bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.27/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "09378cbe9f2a8959a030b5345873ce52454abadb12b338813d983d731e171d10"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
