class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.75"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c76dc632e60cd79a611cb64984d12f99f25410cafae06aaa18b3a2ab40a4b70a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "491bbbc2e673b0e283c25a1abef8f1314ca65524b037020b673885e571e031a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5f04358779aad60f65ee5d50d7db9942e4369926342ba06cbd6309919719e023"
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
