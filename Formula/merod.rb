class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2d9deaa7bc4c0d0d5e08910c07114f1a6d73dd73ed9e9db6c7e81476d8da1f8f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ee0a00cf4c70207004b62fff9139a53a7e082ba78d26bff28d39531cabc56f9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d82390f2bd170fe60a3700d8553ffa32b62eecd993466f5f972afa178fefa66b"
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
