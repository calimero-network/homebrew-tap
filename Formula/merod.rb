class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5fc6075521f2c31d6e4f67639ed6eeb531dbf38720f0e959332b515aabccdccd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/merod_x86_64-apple-darwin.tar.gz"
    sha256 "e480790e01c2796b35c8b1a9cef7c58df00aa0342b2cdb6f6652df9b50c827b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6a7555a71291ff6f43e350ec3296f3d82aec6a583074b766735e4e3be4d7ca31"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db844d5c2966c9a519be3cc8e467f1b725d85e4fb033478479dc1d697e80e4f4"
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
