class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2622c88ed8ff91a0f69c474293ef75410684a57bb1f36c68e03cb9b8f0d12f7e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "04195e77616ee6ba663c144225218314344f49b5bc133663c50e9de54062f86b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "09f0915680edfd77b7524604d334b05ca547b5c43836b84fc291d6172742aee8"
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
