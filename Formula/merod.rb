class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.21"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/merod_aarch64-apple-darwin.tar.gz"
    sha256 "839cf0c9f70ab1abe584f8bfa8ef098f0a484f2ad5b578cdebd23aed83a8bb28"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "90c14f4d28e3d58adbf571ab668c92eb63a874eb87466ba9509bc35d59169ee3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.21/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4f41131ac1a6d9ec5dd79d8643acf9e5c50e813a68299f5856904d5ee65c0ed7"
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
