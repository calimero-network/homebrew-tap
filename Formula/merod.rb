class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ca3443d092046f833846abb2425f69dfbf6175a5263fbc2aea0028781ec6e3e0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a0a982378b6ca50074e284ccae92ddf68392482325e6a1a373548bca6f69a2da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55df83ac34e9fc2d010eb30330d2cb7bcbea0339d0b02fa3a8f6be1e29a164f7"
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
