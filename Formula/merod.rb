class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ae407dda2d849182b9233e3118be26245516b2ff6cf11302c65534147f9fa225"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2916cd7c37e895a2f884325283645697a758da63f930631599e84dbae419a81"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.7/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cae11bcbdb2b09dc6bcb0e3a5456089cc2c8d0d3acd1b8af1752545a55ee5963"
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
