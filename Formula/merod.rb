class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/merod_aarch64-apple-darwin.tar.gz"
    sha256 "9aafa978c3cf4709bacd25fdafe9eb9d7a34a1fc4c1296f110f9157410f0119c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "433f21adcc9c02f243e0eae9a5a9efe9206f6354ba721f793208075d00827b70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "793959e06bb3eb6fc5ef621b032fab342901b329fa307c912f8282f4dc630170"
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
