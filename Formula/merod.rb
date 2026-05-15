class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4d1832eef8a988074b4069273b07ec90b067c8e17789002c76d1622b452f3aeb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "049b0dc705472a208e6aa1fdb1378c7482afc69271d8457ec5269a8850829ae5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7d54f11b44146c4c65b68d879f2da598597cfd73066fee8c2fc63565fc5b070"
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
