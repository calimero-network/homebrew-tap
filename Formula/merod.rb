class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2eb846e3e18ef4b9e3e5d595c1e8487689e6c3e55ab4416d4704f72905791d3a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f257f04f59213202daa78058125fe66b68bcc41c3cb3acc96dec7362711c0fb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.7/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c007434d919c51fef281d20758fb83bb4d3d5bde7a788fd0fe9878e666075ef3"
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
