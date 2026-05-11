class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/merod_aarch64-apple-darwin.tar.gz"
    sha256 "44746b7611584b445a185454f3cb75b3212fa54e4fc2da4d53268d70dc7fb8a7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "97c43d96deb5f50bbb9138df4d0bed90036133e0ef5c85731107589f85ded342"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.36/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8e2cfff11ac1733bfa274e943f0330392ecef0709cecc4d5c0d6a7d22d9b5d6"
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
