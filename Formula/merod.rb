class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/merod_aarch64-apple-darwin.tar.gz"
    sha256 "6ff8e83a5891ca131458801fa959b73001bd0f3d1c98a8649905022147f83644"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bced35350f608298dfd6db7be80e8c301e5b12a5615eaf47ea1f6d11650311ad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.27/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "10fa33d110303b10e98392dec40c3123dc679887cb25dde2b71672c139cab2a6"
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
