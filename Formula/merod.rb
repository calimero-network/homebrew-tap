class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/merod_aarch64-apple-darwin.tar.gz"
    sha256 "abf210610f0931170673520e2444f6377946328c581f82e75b123d44b071eab4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "145e193f916ac6b79d4b7a68c0b5b8876f3b375590a426cbf552bccc61e5bf10"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "19bcc0e4012314eb5b07196d5b213da32d4ec35115c3485b0b73df566f7435f2"
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
