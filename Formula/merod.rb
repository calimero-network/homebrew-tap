class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "59e337fdfc743fa5cd8dce71ad2fbf91a1a34f7bae00ccdc06cab43b1d95e2f2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/merod_x86_64-apple-darwin.tar.gz"
    sha256 "9e0a831e7bbbd576aa9b490572cc151030f70017ac2479086a7598c42b63adb0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0348ce48b52b449f8e74a60a3ccb2a5a88b51d960412a83fccdf5080eab14056"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b0a502c24a95f04da6119b145a6f57415ac271a0de653470c6aae622840cda0"
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
