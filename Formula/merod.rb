class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/merod_aarch64-apple-darwin.tar.gz"
    sha256 "7c5815198fdbf134a001fc2eaf7bb5ea067f7195929ac3f04c8840fc7a693666"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/merod_x86_64-apple-darwin.tar.gz"
    sha256 "e8ae6af56e9847d1c6d5973e4b7357d004311d1b42b949720aedc17911457ec9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c6c3e62104b56d765cee9f193f63491489e7cfbf950123fb301f8e90d015e5e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "53a8f8bc8a2a98fae341d3e5976a72f4aff42264ec7ab37df03dc9c56dc1570a"
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
