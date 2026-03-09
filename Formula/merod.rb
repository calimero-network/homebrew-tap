class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ad19261065cc38dfcbaa86b5ab16baa6e8c6695b26f06f00e4d43c1494d3c54b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e29a923d04833b64e0547968daacb444ddefbe574bf7380a94fdbd94a5175071"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.3/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "326d833ab7bd063075ed2e6cd37b66d7bfafda57a8146774def7b8aa6f864f96"
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
