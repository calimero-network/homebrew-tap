class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3580abdba8a7a1bfa3260ecb234227cc6d482d2ae17cfeb4702e330b23dcda50"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "98318fb0f092804cb32ffaade2eadfba471ce47f9c44570dee2e07f9a68c3059"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.19/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "546df015092aede7f6edb2856d26716ffc6c20af2bd1b35fdac20e4c8385c1c7"
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
