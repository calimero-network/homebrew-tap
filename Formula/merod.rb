class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/merod_aarch64-apple-darwin.tar.gz"
    sha256 "caaa67ed471f58a0fc0c30fd10b81e44b362bbb17226b6ca0530b56120c5edf0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3ccfcdee00d3189fe17afb8856e230fee0e0ff59fcbb062496f5bee4b6cf477c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.26/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51f517755427d34700ed3bc954150a887f5e8611e3211a3591a09a5912d42372"
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
