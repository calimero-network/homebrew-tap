class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.87"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/merod_aarch64-apple-darwin.tar.gz"
    sha256 "0b80ca144972512cb3c3991bd5c49573c0fabae9698f9c3427aa89e746e06777"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0e9bc9ef42b22e057d999b7d04f144f8085dd5f7fb82d6d8a4a82bd9b762b167"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a7a9d0e7b84111e0e5f3670bea8b97cdd4a0b0bc7ff966ecc16963936d71dd1f"
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
